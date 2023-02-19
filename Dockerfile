# Dockerfileの記法
# https://docs.docker.jp/engine/reference/builder.html

FROM ruby:2.6.5

# nodeの最新バージョンインストール
RUN set -x && curl -sL https://deb.nodesource.com/setup_14.x | bash -

# 最新のyarnをインストール
RUN set -x && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# リポジトリを更新し依存モジュールをインストール
RUN set -x && apt-get update -qq && \
  apt-get install -yq build-essential nodejs yarn

# ルート直下に作業用ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /app
WORKDIR /app

# ホストのGemfileをコンテナの/app/Gemfileに追加
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler -v '2.1.4'
RUN bundle install

RUN npm install

# ホストのアプリディレクトリ内を全てコンテナへコピー
ADD . /app