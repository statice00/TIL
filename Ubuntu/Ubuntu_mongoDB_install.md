## 우분투에 MongoDB 설치



### 우분투 버전 확인

```bash
lsb_release -dc
```

### 1. 패키지 관리 시스템에서 사용하는 public key 가져오기

암호를 입력하라고 하면 우분투 패스워드를 입력해주면 된다.
성공적으로 처리되었을 경우 터미널에 OK라고 찍히는 걸 확인할 수 있다.

```bash
 wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
```

### 2. MongoDB를 위한 List 파일 만들기

List 파일을 만드는 방법은 우분투 버전에 따라 다르기 때문에 이 글의 도입부에 안내한대로 본인의 우분투 버전을 확인하고, 그에 맞춰 진행(이 글에서는 우분투 20.04 버전에 맞춰 진행)

```bash
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
```

### 3. 로컬 패키지 데이터베이스 불러오기

MongoDB 패키지 설치를 위해, 먼저 터미널 창에서 다음 명령어를 실행해 로컬 패키지 데이터베이스를 불러온다.

```bash
sudo apt-get update
```

### 4. MongoDB 패키지 설치하기

로컬 패키지 데이터베이스 불러오기가 완료되었다면, 이제 MongoDB 패키지를 설치해주자.
아래의 명령어로 최신 안정 버전의 MongoDB를 설치할 수 있다.

```bash
sudo apt-get install -y mongodb-org
```

### MongoDB 실행/관리용 init 시스템 확인

프로세스를 실행하고 관리하기 위해서 운영체제에 내장된 init 시스템을 사용한다.
최신버전의 우분투는 보통 systemd (systemctl)을 사용하지만, System V Init (service)를 사용하는 경우도 있다.

터미널에 다음 명령어를 실행해 사용 중인 init 시스템을 확인할 수 있다.

응답에 따라 해당 시스템을 사용하면 된다.

- `systemd` - systemd (systemctl) 사용
- `init` - System V Init (service) 사용

```bash
ps --no-headers -o comm 1
```

### 5. MongoDB 실행하기

```bash
sudo service mongod start
```

#### Error : shutting down with code:100

#### Error : shutting down with code:48

100은 data/db 지정

```js
sudo mkdir -p home/statice/data/db
sudo chown -R $USER:$USER home/statice/data/db
mongod --dbpath home/statice/data/db
```

또는 mongod 중복 실행 여부 확인

```js
ps ax | grep mongod

sudo kill [종료할 PID]
```

48은 포트 중복  오류

```js
sudo mongod --port 27018
```



## mongod.conf 파일 설정

### error : mongod: unrecognized service

서비스 실행을 위한 파일이 만들어지지 않아서임. 직접 만들어야 한다.

대상 폴더는 총 두곳이다. /etc/init와 /etc/init.d에 각각 파일을 하나씩 만들어야 한다.

```bash
sudo vi /etc/init/mongod.conf
```

mongod.conf 에 복사 붙여넣기

```js
# vim: set ft=upstart ts=4 et:
description "MongoDB"

start on runlevel [2345]
stop on runlevel [!2345]

# Recommended ulimit values for mongod or mongos
# See http://docs.mongodb.org/manual/reference/ulimit/#recommended-settings
#
limit fsize unlimited unlimited
limit cpu unlimited unlimited
limit as unlimited unlimited
limit nofile 64000 64000
limit rss unlimited unlimited
limit nproc 32000 32000

kill timeout 300 # wait 300s between SIGTERM and SIGKILL.

pre-start script
    mkdir -p /var/lib/mongodb/
    mkdir -p /var/log/mongodb/
end script

script
    ENABLE_MONGODB="yes"
    CONF=/etc/mongodb.conf
    DAEMON=/usr/bin/mongod
    DAEMONUSER=${DAEMONUSER:-mongodb}

    if [ -f /etc/default/mongodb ]; then
        . /etc/default/mongodb
    fi

    # Handle NUMA access to CPUs (SERVER-3574)
    # This verifies the existence of numactl as well as testing that the command works
    NUMACTL_ARGS="--interleave=all"
    if which numactl >/dev/null 2>/dev/null && numactl $NUMACTL_ARGS ls / >/dev/null 2>/dev/null
    then
        NUMACTL="$(which numactl) -- $NUMACTL_ARGS"
        DAEMON_OPTS=${DAEMON_OPTS:-"--config $CONF"}
    else
        NUMACTL=""
        DAEMON_OPTS="-- "${DAEMON_OPTS:-"--config $CONF"}
    fi

    if [ "x$ENABLE_MONGODB" = "xyes" ]; then
        exec start-stop-daemon --start --chuid $DAEMONUSER --exec $NUMACTL $DAEMON $DAEMON_OPTS
    fi
end script
```

/etc/init.d/mongod 에서도 작업

```bash
sudo vi /etc/init.d/mongod
```

mondog 파일에 복사 붙여넣기

```js
#!/bin/sh
#
# init.d script with LSB support.
#
# Copyright (c) 2007 Javier Fernandez-Sanguino 
#
# This is free software; you may redistribute it and/or modify
# it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2,
# or (at your option) any later version.
#
# This is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License with
# the Debian operating system, in /usr/share/common-licenses/GPL;  if
# not, write to the Free Software Foundation, Inc., 59 Temple Place,
# Suite 330, Boston, MA 02111-1307 USA
#
### BEGIN INIT INFO
# Provides:          mongodb
# Required-Start:    $network $local_fs $remote_fs
# Required-Stop:     $network $local_fs $remote_fs
# Should-Start:      $named
# Should-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: An object/document-oriented database
# Description:       MongoDB is a high-performance, open source, schema-free
#                    document-oriented data store that's easy to deploy, manage
#                    and use. It's network accessible, written in C++ and offers
#                    the following features:
#                    .
#                       * Collection oriented storage - easy storage of object-
#                         style data
#                       * Full index support, including on inner objects
#                       * Query profiling
#                       * Replication and fail-over support
#                       * Efficient storage of binary data including large
#                         objects (e.g. videos)
#                       * Auto-sharding for cloud-level scalability (Q209)
#                    .
#                    This package is build with V8 JavaScript engine.
#                    .
#                    High performance, scalability, and reasonable depth of
#                    functionality are the goals for the project.
### END INIT INFO

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/bin/mongod
DESC=database

# Default defaults.  Can be overridden by the /etc/default/$NAME
NAME=mongodb
CONF=/etc/mongodb.conf
RUNDIR=/var/run/mongodb
PIDFILE=$RUNDIR/$NAME.pid
ENABLE_MONGODB=yes

# Include mongodb defaults if available
if [ -f /etc/default/$NAME ] ; then
        . /etc/default/$NAME
fi

# Handle NUMA access to CPUs (SERVER-3574)
# This verifies the existence of numactl as well as testing that the command works
NUMACTL_ARGS="--interleave=all"
if which numactl >/dev/null 2>/dev/null && numactl $NUMACTL_ARGS ls / >/dev/null 2>/dev/null
then
    NUMACTL="`which numactl` -- $NUMACTL_ARGS"
    DAEMON_OPTS=${DAEMON_OPTS:-"--config $CONF"}
else
    NUMACTL=""
    DAEMON_OPTS="-- "${DAEMON_OPTS:-"--config $CONF"}
fi

if test ! -x $DAEMON; then
    echo "Could not find $DAEMON"
    exit 0
fi

if test "x$ENABLE_MONGODB" != "xyes"; then
    exit 0
fi

. /lib/lsb/init-functions

STARTTIME=1
DIETIME=10                   # Time to wait for the server to die, in seconds
                            # If this value is set too low you might not
                            # let some servers to die gracefully and
                            # 'restart' will not work

DAEMONUSER=${DAEMONUSER:-mongodb}
DAEMON_OPTS=${DAEMON_OPTS:-"--unixSocketPrefix=$RUNDIR --config $CONF run"}

set -e

running_pid() {
# Check if a given process pid's cmdline matches a given name
    pid=$1
    name=$2
    [ -z "$pid" ] && return 1
    [ ! -d /proc/$pid ] &&  return 1
    cmd=`cat /proc/$pid/cmdline | tr "\000" "\n"|head -n 1 |cut -d : -f 1`
    # Is this the expected server
    [ "$cmd" != "$name" ] &&  return 1
    return 0
}

running() {
# Check if the process is running looking at /proc
# (works for all users)

    # No pidfile, probably no daemon present
    [ ! -f "$PIDFILE" ] && return 1
    pid=`cat $PIDFILE`
    running_pid $pid $DAEMON || return 1
    return 0
}

start_server() {
            test -e "$RUNDIR" || install -m 755 -o mongodb -g mongodb -d "$RUNDIR"
# Start the process using the wrapper
            start-stop-daemon --background --start --quiet --pidfile $PIDFILE \
                        --make-pidfile --chuid $DAEMONUSER \
                        --exec $NUMACTL $DAEMON $DAEMON_OPTS
            errcode=$?
        return $errcode
}

stop_server() {
# Stop the process using the wrapper
            start-stop-daemon --stop --quiet --pidfile $PIDFILE \
                        --retry 300 \
                        --user $DAEMONUSER \
                        --exec $DAEMON
            errcode=$?
        return $errcode
}

force_stop() {
# Force the process to die killing it manually
        [ ! -e "$PIDFILE" ] && return
        if running ; then
                kill -15 $pid
        # Is it really dead?
                sleep "$DIETIME"s
                if running ; then
                        kill -9 $pid
                        sleep "$DIETIME"s
                        if running ; then
                                echo "Cannot kill $NAME (pid=$pid)!"
                                exit 1
                        fi
                fi
        fi
        rm -f $PIDFILE
}


case "$1" in
  start)
        log_daemon_msg "Starting $DESC" "$NAME"
        # Check if it's running first
        if running ;  then
            log_progress_msg "apparently already running"
            log_end_msg 0
            exit 0
        fi
        if start_server ; then
            # NOTE: Some servers might die some time after they start,
            # this code will detect this issue if STARTTIME is set
            # to a reasonable value
            [ -n "$STARTTIME" ] && sleep $STARTTIME # Wait some time
            if  running ;  then
                # It's ok, the server started and is running
                log_end_msg 0
            else
                # It is not running after we did start
                log_end_msg 1
            fi
        else
            # Either we could not start it
            log_end_msg 1
        fi
        ;;
  stop)
        log_daemon_msg "Stopping $DESC" "$NAME"
        if running ; then
            # Only stop the server if we see it running
                        errcode=0
            stop_server || errcode=$?
            log_end_msg $errcode
        else
            # If it's not running don't do anything
            log_progress_msg "apparently not running"
            log_end_msg 0
            exit 0
        fi
        ;;
  force-stop)
        # First try to stop gracefully the program
        $0 stop
        if running; then
            # If it's still running try to kill it more forcefully
            log_daemon_msg "Stopping (force) $DESC" "$NAME"
                        errcode=0
            force_stop || errcode=$?
            log_end_msg $errcode
        fi
        ;;
  restart|force-reload)
        log_daemon_msg "Restarting $DESC" "$NAME"
                errcode=0
        stop_server || errcode=$?
        # Wait some sensible amount, some server need this
        [ -n "$DIETIME" ] && sleep $DIETIME
        start_server || errcode=$?
        [ -n "$STARTTIME" ] && sleep $STARTTIME
        running || errcode=$?
        log_end_msg $errcode
        ;;
  status)

        log_daemon_msg "Checking status of $DESC" "$NAME"
        if running ;  then
            log_progress_msg "running"
            log_end_msg 0
        else
            log_progress_msg "apparently not running"
            log_end_msg 1
            exit 1
        fi
        ;;
  # MongoDB can't reload its configuration.
  reload)
        log_warning_msg "Reloading $NAME daemon: not implemented, as the daemon"
        log_warning_msg "cannot re-read the config file (use restart)."
        ;;

  *)
        N=/etc/init.d/$NAME
        echo "Usage: $N {start|stop|force-stop|restart|force-reload|status}" >&2
        exit 1
        ;;
esac

exit 0
```





#### Options

필요에 따라 다음 명령어를 실행하여 **MongoDB가 시스템 재부팅 후 시작되도록 설정**할 수 있다.

```bash
sudo service enable mongod
```

필요에 따라 다음 명령어를 실행하여 **MongoDB 프로세스를 중지**할 수 있다.

```bash
sudo service stop mongod
```

필요에 따라 다음 명령어를 실행하여 **MongoDB를 다시 시작**할 수 있다.

```bash
sudo service restart mongod
```



### 6. MongoDB 사용 시작하기

정상적으로 MongoDB가 실행 중이라면 다음 명령어를 통해 MongoDB에 접속해 작업을 시작할 수 있다.

mongod 실행 후에 해야 한다

```bash
# mongodb shell 실행
mongo
```





