from django.shortcuts import render, redirect
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic import ListView, DetailView
from django.contrib.auth import login
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Cat, User, Needs

class CatCreate(LoginRequiredMixin, CreateView):
    model = Cat
    fields = ['name', 'breed', 'sex', 'age', 'health', 'description', 'image_url']
    success_url = '/cats/'

    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

class CatUpdate(LoginRequiredMixin, UpdateView):
    model = Cat
    fields = ['name', 'breed', 'sex', 'age', 'health', 'description', 'image_url']

class CatDelete(LoginRequiredMixin, DeleteView):
    model = Cat
    success_url = '/cats/'

def cats_index(request):
    cats = Cat.objects.all()
    return render(request, 'cats/index.html', { 'cats': cats })

def cats_detail(request, cat_id):
    cat = Cat.objects.get(id=cat_id)
    needs_cat_doesnt_have = Needs.objects.exclude(id__in = cat.needs.all().values_list('id'))
    current_user = request.user
    return render(request, 'cats/detail.html', {
        'cat': cat,
        'user': current_user,
        'needs': needs_cat_doesnt_have,
    })


def home (request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')


def signup(request):
    error_message = ''
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('index')
        else:
            error_message = 'Invalid sign up - try again'
    form = UserCreationForm()
    context = {'form': form, 'error_message': error_message}
    return render(request, 'registration/signup.html', context)

class NeedsList(ListView):
    model = Needs

class NeedsDetail(DetailView):
    model = Needs

class NeedsCreate(CreateView):
    model = Needs
    fields = '__all__'

class NeedsUpdate(UpdateView):
    model = Needs
    fields = ['name', 'quantity', 'link', 'reason']

class NeedsDelete(DeleteView):
    model = Needs
    success_url = '/needs/'

def assoc_needs(request, cat_id, needs_id):
    Cat.objects.get(id=cat_id).needs.add(needs_id)
    return redirect('detail', cat_id=cat_id)

def unassoc_needs(request, cat_id, needs_id):
    Cat.objects.get(id=cat_id).needs.remove(needs_id)
    return redirect('detail', cat_id=cat_id)