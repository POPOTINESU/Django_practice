FROM python:3.11

# Dockerコンテナ上の作業用ディレクトリ設定
WORKDIR /usr/src/app

# __pychache__/pycの生成を無効にする
ENV PYTHONDONTWRITEBYTECODE 1
# 標準入出力におけるpythonのバッファリングを無効にする
ENV PYTHONUNBUFFERED 1

# 仮想環境にインストールしたいパッケージをまとめたテキストファイルを、Dockerにコピー
COPY ./requirements.txt /usr/src/app/requirements.txt

# pip(パッケージ管理), pipenv(仮想環境構築/パッケージ管理)で必要なモジュールを、コンテナboards-appへインストール
RUN pip install --upgrade pip \
&& pip install pipenv \
&& pip install psycopg2 \
&& pipenv install \
&& pipenv install -r requirements.txt
# psycopg2：pythonでpostgreSQLを使えるようにするためのライブラリ

# Dockerコンテナ上のpythonパッケージ管理用ファイルを、Dockerにコピー
COPY ./Pipfile /usr/src/app/Pipfile

# --system：システムのpipコマンドを使用[3]
RUN pipenv install --system

# Dockerコンテナ上のカレントディレクトリ（現在のディレクトリ）をDockerにコピー
COPY . /usr/src/app/
