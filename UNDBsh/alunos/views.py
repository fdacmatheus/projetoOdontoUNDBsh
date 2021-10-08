from django.shortcuts import render, redirect

# Create your views here.
def AlunoIndex(request):
    if not (request.user.is_authenticated and request.user.get_tipo() == 'aluno'):
        return redirect('website:login', permanent=True)

    return render(request, 'website/aluno.html')