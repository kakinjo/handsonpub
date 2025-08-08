FROM python:3.12-alpine

RUN apk add --no-cache tzdata

ENV TZ=Asia/Tokyo

RUN pip3 install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org awscli

RUN echo "test" > /test.txt

CMD sh -c 'aws s3 cp /test.txt s3://test-isj-tky-s3-batch/output/test_$(date +%Y%m%d_%H%M%S).txt'
