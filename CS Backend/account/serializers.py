from rest_framework import serializers
from account.models import Account, AccountProfile


class AccountProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = AccountProfile
        fields = ('title', 'first_name', 'middle_name', 'last_name', 'date_of_birth',
                  'phone_number', 'job', 'company', 'admin', 'avatar')


class AccountSerializer(serializers.HyperlinkedModelSerializer):
    account = AccountProfileSerializer(required=True)

    class Meta:
        model = Account
        fields = ('url', 'email', 'first_name', 'last_name', 'password', 'account')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        account_data = validated_data.pop('account')
        password = validated_data.pop('password')
        account = Account(**validated_data)
        account.set_password(password)
        account.save()
        AccountProfile.objects.create(user=account, **account_data)
        return account

    def update(self, instance, validated_data):
        account_data = validated_data.pop('account')
        account = instance.account

        instance.email = validated_data.get('email', instance.email)
        instance.save()

        account.title = account_data.get('title', account.title)
        account.first_name = account_data.get('first_name', account.first_name)
        account.middle_name = account_data.get('middle_name', account.middle_name)
        account.last_name = account_data.get('last_name', account.last_name)
        account.date_of_birth = account_data.get('date_of_birth', account.date_of_birth)
        account.phone_number = account_data.get('phone_number', account.phone_number)
        account.job = account_data.get('job', account.job)
        account.company = account_data.get('company', account.company)
        account.admin = account_data.get('admin', account.admin)
        account.avatar = account_data.get('avatar', account.avatar)
        account.save()

        return instance
