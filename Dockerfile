FROM ubuntu:latest

ENV build_dep='g++ gfortran python3-dev python3-pip python3-setuptools'
ENV build_dev='libopenblas-dev liblapack-dev'

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         python3 ca-certificates \
         $build_dep \
         $build_dev \
    && CPPFLAGS="-g0 -Wl,--strip-all -I/usr/include:/usr/local/include -L/usr/lib:/usr/local/lib" \
    pip3 install --no-cache-dir --compile --global-option=build_ext --global-option=build_clib \
    numpy pandas \
    && apt-get purge -y --auto-remove $build_dep \
    && apt-get purge -y $build_dev \
    && find /usr/local/lib/python3.*/ -name 'tests' -exec rm -r {} + \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

CMD ["python"]
