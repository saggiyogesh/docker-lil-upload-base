FROM dpokidov/imagemagick

RUN yum install -y git poppler ffmpeg ghostscript-9.22-6.fc27

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -

RUN yum install -y nodejs
