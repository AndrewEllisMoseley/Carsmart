from django.urls import path
from rest_framework_simplejwt import views as jwt_views
from .views import ObtainTokenPairWithAccountView, UserListCreateView, UserDetailView

urlpatterns = [
    path('token/obtain/', ObtainTokenPairWithAccountView.as_view(), name='token_create'),  # override sjwt stock token
    path('token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    # gets all user profiles and create a new profile
    path('user/', UserListCreateView.as_view(), name="all-users"),
    # retrieves profile details of the currently logged in user
    path('user/<int:pk>', UserDetailView.as_view(), name="user"),
]
