from django.shortcuts import render, redirect
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic import ListView, DetailView
from .forms import PendingForm
from django.contrib.auth import login
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Cat, Needs

class CatCreate(LoginRequiredMixin, CreateView):
    model = Cat
    fields = ['name', 'species', 'sex', 'age', 'health', 'description', 'image_url']
    success_url = '/cats/'

    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

class CatUpdate(LoginRequiredMixin, UpdateView):
    model = Cat
    fields = ['name', 'species', 'sex', 'age', 'health', 'description', 'image_url']

class CatDelete(LoginRequiredMixin, DeleteView):
    model = Cat
    success_url = '/cats/'

def cats_index(request):
    cats = Cat.objects.all()
    return render(request, 'cats/index.html', { 'cats': cats })

def cats_detail(request, cat_id):
    cat = Cat.objects.get(id=cat_id)
    current_user = request.user
    needs_cat_doesnt_have = Needs.objects.exclude(id__in = cat.needs.all().values_list('id'))
    pending_form = PendingForm()
    return render(request, 'cats/detail.html', {
        'cat': cat,
        'user': current_user,
        'needs': needs_cat_doesnt_have,
        'pending_form': pending_form,
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

class NeedsList(LoginRequiredMixin, ListView):
    model = Needs

class NeedsDetail(LoginRequiredMixin, DetailView):
    model = Needs

class NeedsCreate(LoginRequiredMixin, CreateView):
    model = Needs
    fields = '__all__'

class NeedsUpdate(LoginRequiredMixin, UpdateView):
    model = Needs
    fields = ['name', 'quantity', 'link', 'reason']

class NeedsDelete(LoginRequiredMixin, DeleteView):
    model = Needs
    success_url = '/needs/'

@login_required
def assoc_needs(request, cat_id, needs_id):
    Cat.objects.get(id=cat_id).needs.add(needs_id)
    return redirect('detail', cat_id=cat_id)

@login_required
def unassoc_needs(request, cat_id, needs_id):
    Cat.objects.get(id=cat_id).needs.remove(needs_id)
    return redirect('detail', cat_id=cat_id)

@login_required
def user_index(request):
    # current_user = request.user
    cats = Cat.objects.all()
    return render(request, 'main_app/user_portal.html', { 'cats': cats, 
    # 'user': current_user 
    })

class UpdatePending(LoginRequiredMixin, UpdateView):
    model = Cat
    fields = ['pending']
    
@login_required
def admin_portal(request):
    cats = Cat.objects.all()
    return render(request, 'main_app/admin_portal.html', {'cats': cats})
