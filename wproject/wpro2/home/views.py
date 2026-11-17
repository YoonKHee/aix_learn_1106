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
    l_proba = np.round(l_proba,decimals=2)
    proba = proba[0]*100
    proba = np.round(proba,decimals=3)
    proba = list(proba)
    name = list(model.classes_)
    print('입력',result)
    print(f'출력{proba}{l_proba:.2f}')
    # np.array() 타입을 list()타입으로 변경해야지만 보내짐
    context = {
        'result_data':f'{result1[0]}', # 해당생선
        'result':'success', 
        'labels':name,                 # 생선이름
        'proba':proba,                 # 생성들확률
        'result3':l_proba              # 해당생선확률
    }
    return JsonResponse(context)


def index(request):
    return render(request,'index.html')






# 와인으로 모델3 만들어서 프로젝트 만들어서 그래프 표시까지하기.