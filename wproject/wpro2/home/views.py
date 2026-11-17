from django.shortcuts import render
from pathlib import Path
from django.http import JsonResponse
import numpy as np
import os
import joblib
# Create your views here.

BASE_DIR = Path(__file__).resolve().parent.parent
model = joblib.load(BASE_DIR / 'model_ex.joblib')

def ajax_data(resquest):
    data = resquest.POST.get('data','242,25.4,30,11.52,4.02')

    in_data = data
    result = list(map(float,in_data.split(',')))

    result1 = model.predict([result])
    proba = model.predict_proba([result])
    l_proba = proba.max()
    l_proba = l_proba*100
    proba = np.round(proba,decimals=3)
    proba = proba[0]*100
    print('입력',result)
    print(f'출력{proba}{l_proba:.2f}')

    context = {
        'result_data':f'{result1[0]}','result':'success','labels':list(model.classes_),'proba':proba.tolist()
    }
    return JsonResponse(context)


def index(request):
    return render(request,'index.html')