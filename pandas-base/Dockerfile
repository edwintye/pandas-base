FROM ubuntu:latest

ENV build_dep='curl'

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         python3 python3-distutils ca-certificates \
         $build_dep \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py \
    && pip install --no-cache-dir --compile numpy pandas \
    && apt-get purge -y --auto-remove $build_dep \
    && find /usr/local/lib/python3.*/ -name 'tests' -exec rm -r {} + \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

CMD ["python"]