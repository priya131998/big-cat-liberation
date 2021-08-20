from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('cats/', views.cats_index, name='index'),
    path('cats/create/', views.CatCreate.as_view(), name='cats_create'),
    path('cats/<int:cat_id>', views.cats_detail, name='detail'),
    path('cats/<int:pk>/update', views.CatUpdate.as_view(), name='cats_update'),
    path('cats/<int:pk>/delete', views.CatDelete.as_view(), name='cats_delete'),
    path('needs/', views.NeedsList.as_view(), name='needs_index'),
    path('needs/<int:pk>/', views.NeedsDetail.as_view(), name='needs_detail'),
    path('needs/create/', views.NeedsCreate.as_view(), name='needs_create'),
    path('needs/<int:pk>/update/', views.NeedsUpdate.as_view(), name='needs_update'),
    path('needs/<int:pk>/delete/', views.NeedsDelete.as_view(), name='needs_delete'),
    path('needs/<int:cat_id>/assoc_needs/<int:needs_id>/', views.assoc_needs, name='assoc_needs'),
    path('accounts/signup/', views.signup, name='signup'),
]