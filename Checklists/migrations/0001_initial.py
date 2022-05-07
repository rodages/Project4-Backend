# Generated by Django 4.0.4 on 2022-05-07 15:25

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('InventoryItems', '0005_rename_item_name_inventoryitem_name_and_more'),
        ('Tasks', '0008_rename_comments_task_comment_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Checklist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default=None, max_length=100)),
                ('description', models.CharField(default=None, max_length=100)),
                ('amount', models.PositiveIntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now=True, null=True)),
                ('edited_at', models.DateTimeField(auto_now=True, null=True)),
                ('sales_target', models.FloatField(default=0)),
                ('inventory_items', models.ManyToManyField(blank=True, related_name='checklist_items', to='InventoryItems.inventoryitem')),
                ('tasks', models.ManyToManyField(blank=True, related_name='checklist_tasks', to='Tasks.task')),
            ],
        ),
    ]
