# Generated by Django 4.0.4 on 2022-05-04 13:01

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Checklist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default=None, max_length=100)),
                ('description', models.CharField(default=None, max_length=100)),
                ('Amount', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now=True, null=True)),
                ('edited_at', models.DateTimeField(auto_now=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='InventoryItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('itemName', models.CharField(default=None, max_length=200, null=True)),
                ('extraFromChecklistAmount', models.IntegerField(default=0)),
                ('completed_status', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now=True, null=True)),
                ('edited_at', models.DateTimeField(auto_now=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Subsection',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default=None, max_length=200, null=True)),
                ('created_at', models.DateTimeField(auto_now=True, null=True)),
                ('edited_at', models.DateTimeField(auto_now=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Task_name', models.CharField(default=None, max_length=200, null=True)),
                ('comments', models.CharField(default=None, max_length=500, null=True)),
                ('created_at', models.DateTimeField(auto_now=True, null=True)),
                ('edited_at', models.DateTimeField(auto_now=True, null=True)),
            ],
        ),
    ]
