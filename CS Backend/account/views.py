from rest_framework import viewsets
from rest_framework.permissions import AllowAny

from account.models import AccountProfile
from account.serializers import AccountProfileSerializer
from account.permissions import IsLoggedInUserOrAdmin, IsAdminUser


class AccountViewSet(viewsets.ModelViewSet):
    queryset = AccountProfile.objects.all()
    serializer_class = AccountProfileSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]

