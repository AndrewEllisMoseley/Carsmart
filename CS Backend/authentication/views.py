from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import permissions
from .serializers.custom_token_serializer import CustomTokenObtainPairSerializer


class ObtainTokenPairWithAccountView(TokenObtainPairView):
    permission_classes = (permissions.AllowAny,)
    serializer_class = CustomTokenObtainPairSerializer
