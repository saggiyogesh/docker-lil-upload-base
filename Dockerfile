FROM dpokidov/imagemagick

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -

RUN yum install -y poppler ffmpeg ghostscript-9.22-6.fc27 nodejs git
