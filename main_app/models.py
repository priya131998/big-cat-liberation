from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User

# Create your models here.
admins = User.objects.filter(is_superuser = True)

APP_STATUS = (
    ('Pending', 'Pending...'),
    ('Approved', 'Approved'),
    ('Denied', 'Denied'),
)

class Needs(models.Model):
    name = models.CharField(max_length=50)
    quantity = models.IntegerField()
    link = models.CharField(max_length=1000)
    reason = models.TextField(max_length=250)

    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('needs_detail', kwargs={'pk': self.id})

class Cat(models.Model):
    name = models.CharField(max_length=50)
    species = models.CharField(max_length=50)
    sex = models.CharField(max_length=50)
    age = models.IntegerField()
    health = models.CharField(max_length=50)
    description = models.TextField(max_length=250)
    image_url = models.CharField(max_length=1000)
    needs = models.ManyToManyField(Needs)
    pending = models.CharField(
        max_length=8,
        choices=APP_STATUS,
        default=APP_STATUS[0][0],
        )
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("detail", kwargs={"cat_id": self.id})
    
    