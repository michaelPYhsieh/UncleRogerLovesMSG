from django.shortcuts import render

# Create your views here.
from django.shortcuts import redirect
from .models import Post
from .forms import RegisterForm
from .forms import LoginForm
from .forms import PostForm

# 使用內建登入登出
from django.contrib.auth import authenticate, login, logout

from django.utils import timezone
from django.shortcuts import get_object_or_404


def index(request):
    '''
        app 首頁
    '''
    posts = Post.objects.filter(date__lte=timezone.now()).order_by('date')
    position = 'app/index.html'

    return render(request, position, locals())


def register(request):
    # form = UserCreationForm() # j預設
    form = RegisterForm()  # 自訂
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/login')
    position = 'app/register.html'
    return render(request, position, locals())


def log_in(request):
    if request.user.is_authenticated:
        return redirect('/')

    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user and user.is_active:
            login(request, user)
            return redirect('/')
        error = True

    form = LoginForm()
    position = 'app/login.html'
    return render(request, position, locals())


def log_out(request):
    logout(request)
    # position = 'app/logout.html'
    # return render_to_response(position, locals())
    return redirect('/')


def write_post(request):
    # 登入才可執行 meth
    # from django.contrib.auth.decorators import login_required
    # @login_required
    if not request.user.is_authenticated:
        return redirect('/login/')

    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.username = request.user
            post.date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    position = 'app/write_post.html'
    return render(request, position, locals())


def post_detail(request, pk):
    # post = Post.objects.get(id=pk)
    post = get_object_or_404(Post, pk=pk)
    position = 'app/post_detail.html'
    return render(request, position, locals())
