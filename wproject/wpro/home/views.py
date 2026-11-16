from django.shortcuts import render
from pathlib import Path
from django.http import JsonResponse
import os
import joblib
# Create your views here.
def ajax_data(request):
    context = {
        'result':'40,11.73,7.22','result':878.40
    }
    return JsonResponse(context)

def main(request):
    data = request.POST.get('data','40.0,11.73,7.22')
    context = {'result':data,'result2':878.40}
    return render(request,'main.html',context)