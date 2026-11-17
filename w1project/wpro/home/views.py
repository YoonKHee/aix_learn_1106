from django.shortcuts import render
from pathlib import Path
from django.http import JsonResponse
import os
import joblib
# Create your views here.


BASE_DIR = Path(__file__).resolve().parent.parent 
model = joblib.load(BASE_DIR / "model.joblib") # 전역변수로 사용해야 편함.
    

def ajax_data(request):
    data = request.POST.get('data','242,25.4,30,11.52,4.02')
    
    # 파일 변환
    in_data = data
    in_data = in_data.split(',')
    result = list(map(float,in_data))

    # 예측
    print('입력데이터 : ',result)
    proba = model.predict_proba([result])[0]*100
    result = model.predict([result])
    print(f'예측종류 : {result[0]},{proba} ')
    # 파일전달
    context = {
        'result_data':f'{result[0]}','result':'success','labels':list(model.classes_),'proba':[round(p,1) for p in proba]
    }
    return JsonResponse(context)




def main(request):
    # BASE_DIR = Path(__file__).resolve().parent.parent
    # model = joblib.load(BASE_DIR / 'model.joblib')# 라이브러리를 로딩하겠다
    
    # # 예측
    # in_data='40,11.73,7.22'
    # in_data = list(map(float,in_data.split(',')))
    # result = model.predict([in_data])

    return render(request,'main.html')