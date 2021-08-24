from django.forms import ModelForm
from .models import Cat


class PendingForm(ModelForm):
    class Meta:
        model = Cat
        fields = ["pending"]