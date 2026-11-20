{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "a590baab",
   "metadata": {},
   "outputs": [],
   "source": [
    "import json\n",
    "import pandas as pd\n",
    "import requests"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "72550272",
   "metadata": {},
   "outputs": [],
   "source": [
    "with open('data/searchMovieList.json', encoding='utf-8')as f:\n",
    "    data = json.load(f)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "2a9e6226",
   "metadata": {},
   "outputs": [],
   "source": [
    "movie = data[\"movieListResult\"]['movieList']"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "022e7f04",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "totCnt                                                  123148\n",
       "source                                                 영화진흥위원회\n",
       "movieList    [{'movieCd': '20268881', 'movieNm': '힙,싸부', 'm...\n",
       "Name: movieListResult, dtype: object"
      ]
     },
     "execution_count": 13,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "df = df['movieListResult']\n",
    "df"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.13.15"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
