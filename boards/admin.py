from django.contrib import admin

from .models import message
from .models import Board
# Register your models here.
admin.site.register(message)

class BoardAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'created_datetime', 'updated_datetime')
    list_display_links = ('id','title')
admin.site.register(Board, BoardAdmin)
