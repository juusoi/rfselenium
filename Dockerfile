FROM python:3.8
WORKDIR /robot

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    udev \
    chromium \
    chromium-driver \
    xvfb

RUN python3 -m pip install --no-cache-dir --upgrade pip

COPY . .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN sed -i "s/self._arguments\ =\ \[\]/self._arguments\ =\ \['--no-sandbox',\ '--disable-gpu'\]/" /usr/local/lib/python3.8/site-packages/selenium/webdriver/chrome/options.py

COPY entrypoint.sh /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
