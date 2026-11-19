import requests

url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
url = url + "?key=5fd7e4ddc65e5b4bb2f030ca3b612524&itemPerPage=100"

res = requests.get(url)
data = res.json()            # JSON → 딕셔너리

movies = data["movieListResult"]["movieList"]   # 영화 목록(리스트)

print(len(movies))           # 100 이 나오면 성공
print(movies[0])             # 첫 번째 영화
print(movies[0]["movieNm"])  # 첫 번째 영화 제목

for m in movies:
    print(m["movieCd"], m["movieNm"], m["openDt"], m["genreAlt"])
    f = open("movie_list.csv", "w", encoding="utf-8-sig")

f.write("movieCd,movieNm,prdtYear,openDt,typeNm,nationAlt,genreAlt,director\n")   # 제목 줄

for m in movies:
    # 감독은 리스트라서 따로 처리 (없으면 빈칸)
    director = ""
    if len(m["directors"]) > 0:
        director = m["directors"][0]["peopleNm"]

    # 제목이나 장르에 콤마가 있어서 " " 로 감싸기
    line = m["movieCd"] + ',"' + m["movieNm"] + '",' + m["prdtYear"] + "," + m["openDt"] + "," \
         + m["typeNm"] + ',"' + m["nationAlt"] + '","' + m["genreAlt"] + '","' + director + '"\n'
    f.write(line)

f.close()
print("저장 완료!")