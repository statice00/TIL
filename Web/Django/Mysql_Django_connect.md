### Mysql Django 연동



- 가상환경 실행

    ```bash
    conda activate DataEn
    ```

- connector 설치

    ```bash
    pip install mysqlclient
    ```

- my_settings.py 설정

    db정보 설정

    ```python
    DATABASES = {
        # 'default': {
        #     'ENGINE': 'django.db.backends.sqlite3',
        #     'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        # }
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'farmoney',
            'USER': 'root',
            'PASSWORD': 'a1234',
            'HOST': '127.0.0.1',
            'PORT': '3306',
        }
    }
    # 기존 settings.py에 있던 시크릿키
    SECRET_KEY = '^j=1^-mh^%ew07aqme1%_peedb%ywgyj&@ry%!tcz7)c3a+_9d'
    ```

- settings.py 설정

    ```python
    # 추가해줄 부분
    import my_settings
    
    DATABASES = my_settings.DATABASES
    SECRET_KEY = my_settings.SECRET_KEY
    ```

- DB감지

    inspectdb를 실행하면 자동으로 해당 db에 존재하는 테이블들을 정리하여 터미널창에 출력
    
    ```bash
    python manage.py inspectdb
    ```
    
- 터미널 출력결과 복사 -> models.py에 삽입

    ```python
    from django.db import models
    
    class MarketWholesale(models.Model):
        delng_de = models.BigIntegerField(db_column='DELNG_DE', blank=True, null=True)  # Field name made lowercase.
        pum_nm = models.TextField(db_column='PUM_NM', blank=True, null=True)  # Field name made lowercase.    
        g_name = models.TextField(db_column='G_NAME', blank=True, null=True)  # Field name made lowercase.    
        u_name = models.TextField(db_column='U_NAME', blank=True, null=True)  # Field name made lowercase.    
        mi_p = models.TextField(db_column='MI_P', blank=True, null=True)  # Field name made lowercase.        
        ma_p = models.TextField(db_column='MA_P', blank=True, null=True)  # Field name made lowercase.        
        av_p = models.TextField(db_column='AV_P', blank=True, null=True)  # Field name made lowercase.        
        pav_p = models.TextField(db_column='PAV_P', blank=True, null=True)  # Field name made lowercase.      
        fluc = models.TextField(db_column='FLUC', blank=True, null=True)  # Field name made lowercase.        
        d_mark = models.FloatField(db_column='D_MARK', blank=True, null=True)  # Field name made lowercase.   
        j_7 = models.TextField(db_column='J_7', blank=True, null=True)  # Field name made lowercase.
        j_7_mark = models.FloatField(db_column='J_7_MARK', blank=True, null=True)  # Field name made lowercase.
    
        class Meta:
            managed = False
            db_table = 'market_wholesale'
    
    
    class Weather(models.Model):
        관측지점명 = models.TextField(blank=True, null=True)
        관측시각 = models.TextField(blank=True, null=True)
        기온 = models.FloatField(blank=True, null=True)  
        최고기온 = models.FloatField(blank=True, null=True)
        최저기온 = models.FloatField(blank=True, null=True)
        습도 = models.FloatField(blank=True, null=True)  
        풍속 = models.FloatField(blank=True, null=True)  
        강수량 = models.FloatField(blank=True, null=True)
        일조시간 = models.FloatField(blank=True, null=True)
        일사량 = models.FloatField(blank=True, null=True)
        결로시간 = models.FloatField(blank=True, null=True)
        연도 = models.BigIntegerField(blank=True, null=True)
        월 = models.BigIntegerField(blank=True, null=True)
        일 = models.BigIntegerField(blank=True, null=True)
    
        class Meta:
            managed = False
            db_table = 'weather'
    
    
    class Wholesale1(models.Model):
        delng_de = models.BigIntegerField(db_column='DELNG_DE', blank=True, null=True)  # Field name made lowercase.
        pblmng_whsal_mrkt_nm = models.TextField(db_column='PBLMNG_WHSAL_MRKT_NM', blank=True, null=True)  # Field name made lowercase.
        cpr_nm = models.TextField(db_column='CPR_NM', blank=True, null=True)  # Field name made lowercase.    
        price = models.FloatField(db_column='PRICE', blank=True, null=True)  # Field name made lowercase.     
        delngbundle_qy = models.FloatField(db_column='DELNGBUNDLE_QY', blank=True, null=True)  # Field name made lowercase.
        stndrd = models.TextField(db_column='STNDRD', blank=True, null=True)  # Field name made lowercase.    
        delng_qy = models.BigIntegerField(db_column='DELNG_QY', blank=True, null=True)  # Field name made lowercase.
        sanji_nm = models.TextField(db_column='SANJI_NM', blank=True, null=True)  # Field name made lowercase.
        volume = models.FloatField(db_column='VOLUME', blank=True, null=True)  # Field name made lowercase.   
    
        class Meta:
            managed = False
            db_table = 'wholesale1'
    
    
    class Wholesale2(models.Model):
        delng_de = models.BigIntegerField(db_column='DELNG_DE', blank=True, null=True)  # Field name made lowercase.
        pblmng_whsal_mrkt_nm = models.TextField(db_column='PBLMNG_WHSAL_MRKT_NM', blank=True, null=True)  # Field name made lowercase.
        cpr_nm = models.TextField(db_column='CPR_NM', blank=True, null=True)  # Field name made lowercase.    
        price = models.FloatField(db_column='PRICE', blank=True, null=True)  # Field name made lowercase.     
        delngbundle_qy = models.FloatField(db_column='DELNGBUNDLE_QY', blank=True, null=True)  # Field name made lowercase.
        stndrd = models.TextField(db_column='STNDRD', blank=True, null=True)  # Field name made lowercase.    
        delng_qy = models.BigIntegerField(db_column='DELNG_QY', blank=True, null=True)  # Field name made lowercase.
        sanji_nm = models.TextField(db_column='SANJI_NM', blank=True, null=True)  # Field name made lowercase.                                                     ank=True, null=True)  # Field name made lowercase.
        volume = models.FloatField(db_column='VOLUME', blank=True, null=True)  # Field name made lowercase.   
    
        class Meta:
            managed = False
            db_table = 'wholesale2' 
    ```

- views.py 에 반영

    ```python
    from .models import MarketWholesale
    from .models import Weather
    from .models import Wholesale1
    from .models import Wholesale2
    
    def MarketWholesale_view(request):
    	MarketWholesale_list = MarketWholesale.objects.all()
    	return render(request, 'my_app/view_students2.html', {'MarketWholesale_list': MarketWholesale_list})
    
    def Weather_view(request):
    	Weather_list = Weather.objects.all()
    	return render(request, 'my_app/view_students2.html', {'Weather_list': Weather_list})
    
    def Wholesale1_view(request):
    	Wholesale1_list = Wholesale1.objects.all()
    	return render(request, 'my_app/view_students2.html', {'Wholesale1_list': Wholesale1_list})
    
    def Wholesale2_view(request):
    	Wholesale2_list = Wholesale2.objects.all()
    	return render(request, 'my_app/view_students2.html', {'Wholesale2_list': Wholesale2_list})
    ```

- urls.py 에 반영

    ```python
    path('MarketWholesale_view', views.MarketWholesale_view, name='MarketWholesale_view'),
    path('Weather_view', views.Weather_view, name='Weather_view'),
    path('Wholesale1_view', views.Wholesale1_view, name='Wholesale1_view'),
    path('Wholesale2_view', views.Wholesale2_view, name='Wholesale2_view'),
    ```

- 변경된 model을 db에 알려줌

    ```bash
    python manage.py makemigrations
    ```

    ```bash
    python manage.py migrate
    ```

- admin.py 에 삽입

    ```python
    from .models import MarketWholesale
    from .models import Weather
    from .models import Wholesale1
    from .models import Wholesale2
    
    admin.site.register(MarketWholesale)
    admin.site.register(Weather)
    admin.site.register(Wholesale1)
    admin.site.register(Wholesale2)
    ```

    

- django 서버 실행

    ```bash
    python manage.py runserver
    ```

    http://127.0.0.1:8000

    
