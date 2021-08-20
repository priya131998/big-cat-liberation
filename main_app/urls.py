from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('cats/', views.cats_index, name='index'),
    path('cats/create/', views.CatCreate.as_view(), name='cat_create'),
    path('cats/<int:cat_id>', views.cats_detail, name='detail'),
    path('accounts/signup/', views.signup, name='signup'),
]