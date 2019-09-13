FROM ubuntu:19.10

ENV build_dep='g++ gfortran python3-dev curl'
ENV build_dev='libopenblas-dev'

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         python3 python3-distutils ca-certificates \
         $build_dep \
         $build_dev \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py \
    && CPPFLAGS="-g0 -Wl,--strip-all -I/usr/include:/usr/local/include -L/usr/lib:/usr/local/lib" \
    pip install --no-cache-dir --compile --global-option=build_ext \
    numpy pandas \
    && apt-get purge -y --auto-remove $build_dep \
    && apt-get purge -y $build_dev \
    && find /usr/local/lib/python3.*/ -name 'tests' -exec rm -r {} + \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

CMD ["python"]