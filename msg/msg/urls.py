from django.contrib import admin
from django.urls import path


# modi
from django.conf.urls import include


# from .views import homepage
admin.autodiscover()


urlpatterns = [
    path('admin/', admin.site.urls),
]


# modi
# urlpatterns += [
#     # 首頁
#     path('homepage/', homepage, name='Homepage'),
# ]

urlpatterns += [
    path('',  include('app.urls')),
]
