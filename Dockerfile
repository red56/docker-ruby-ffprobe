FROM ruby:2.4.5-jessie

ENV FFMPEG_VERSION=2.8
ENV FFMPEG_DOWNLOAD_URL https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz
RUN mkdir /input /output
WORKDIR /input

RUN apt-get update -y

RUN curl -sSL "$FFMPEG_DOWNLOAD_URL" -o ffmpeg.tar.xz

RUN tar -xvJf ffmpeg.tar.xz \
	&& mv ffmpeg-* ffmpeg \
	&& cp ffmpeg/ffprobe /usr/bin/ \
  && rm -rf ffmpeg \
	&& rm -rf ffmpeg.tar.xz \
	&& rm -rf /var/cache/apk/*

RUN apt-get install -y \
  build-essential

