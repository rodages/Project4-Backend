# Generated by Django 4.0.4 on 2022-05-07 16:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Shifts', '0003_remove_shift_checklists_shift_checklists'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shift',
            name='checklist',
            field=models.ManyToManyField(related_name='items', to='Shifts.checklistitem'),
        ),
    ]
