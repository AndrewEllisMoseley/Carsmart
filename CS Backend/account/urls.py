from django.conf.urls import url, include
from rest_framework import routers
from account.views import AccountViewSet

router = routers.DefaultRouter()
router.register(r'accounts', AccountViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^auth/', include('rest_auth.urls')),
]
