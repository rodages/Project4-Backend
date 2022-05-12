from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password

from Users.models import CustomUser
from django.contrib.auth.models import User

# class AbstractUserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ''


class UpdateUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ("DOB", "postcode", "email", "password",
                  "is_active", "role", "username")


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = '__all__'


class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('username', 'password', 'password_repeat',
                  'email', 'first_name', 'last_name', 'DOB')
        # add extra validations via `extra_kwargs`
        extra_kwargs = {
            'first_name': {'required': True},
            'last_name': {'required': True}
        }
    DOB = serializers.DateField()
    # make sure email in DB is unique via `UniqueValidator`
    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=CustomUser.objects.all())]
    )

    # Use the built-in `validate_password` validator from Django
    password = serializers.CharField(
        write_only=True,
        required=True,
        validators=[validate_password]
    )
    password_repeat = serializers.CharField(write_only=True, required=True)

    def validate(self, attributes):
        """this validation runs after the validations of each field"""

        if attributes['password'] != attributes['password_repeat']:
            raise serializers.ValidationError(
                {"password": "Password fields don't match."})

        return attributes

    def create(self, data):
        """data is already validated at this point"""

        user = CustomUser.objects.create(
            # username=data['username'],
            username=f"{data['first_name'].lower()}.{data['last_name'].lower()}",
            email=data['email'],
            first_name=data['first_name'],
            last_name=data['last_name'],
            DOB=data['DOB']
        )

        # Password has to be set via `set_password` in order to be hashed!
        user.set_password(data['password'])

        # save serialized user to DB
        user.save()

        # Uncomment these print statements to compare non-hashed password and hashed password
        print('unserialized password which arrived in JSON format from frontend',
              data['password'])
        print('password stored in DB', getattr(user, 'password'))

        # Alternative to `User.create`: Use `User.create_user` method
        # user = User.objects.create_user(
        #     data['username'],
        #     password=data['password'],
        #     first_name=data['first_name'],
        #     last_name=data['last_name'],
        #     email=data['email']
        # )

        return user
