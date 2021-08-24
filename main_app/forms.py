from django.forms import ModelForm
from .models import Status


class PendingForm(ModelForm):
    class Meta:
        model = Status
        fields = ["pending"]