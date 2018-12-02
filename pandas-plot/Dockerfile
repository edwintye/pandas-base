FROM edwintye/pandas-base:latest

ENV build_dep='g++ python3-dev python3-pip python3-setuptools'
ENV build_dev='libopenblas-base liblapack3'

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         python3 ca-certificates \
         $build_dep \
         $build_dev \
    && pip3 install --no-cache-dir --compile matplotlib
    && apt-get purge -y --auto-remove $build_dep \
    && find /usr/local/lib/python3.*/ -name 'tests' -exec rm -r {} + \
    && rm -rf /var/lib/apt/lists/*

CMD ["python"]
