from django.contrib import admin
from django.urls import path


# modi
from django.conf.urls import url
from .views import *


admin.autodiscover()


urlpatterns = [
    path('', index, name='Index'),
]

urlpatterns += [
    path('register/', register, name='Register'),
    path('login/', log_in, name='Login'),
    path('logout/', log_out, name='Logout'),
]

urlpatterns += [
    path('write_post/', write_post, name='Write_post'),
    path('post/<int:pk>/', post_detail, name='post_detail'),
]
