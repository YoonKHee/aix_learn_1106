from sklearn import svm, metrics

# 1. 데이터준비 - 학습데이터, 테스트데이터 분리 8:2
# 학습데이터 : 2차원 배열형태
data = [ [0,0],[0,1],[1,0],[1,1] ]
label = [0,1,1,0]

# 테스트데이터
test_data = [[0,0],[1,0]]
test_label = [0,1]


# 2. 데이터 학습 
clf = svm.SVC() # 알고리즘선택
clf.fit(data, label) # 학습시키기

# fit 학습
# predict 예측

# 3. 데이터 예측
results = clf.predict(test_data)# 테스트 데이터를 가지고 예측실행
print('예측결과:',results) # 0,1


# 4. 정답률
score = metrics.accuracy_score(test_label,results)
print('정답률:',score)