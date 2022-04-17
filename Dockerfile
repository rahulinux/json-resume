

FROM node:lts-bullseye-slim

RUN apt-get update \
    && apt-get install -y \
        make \
        bash \
        # See: https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix
            ca-certificates \
            fonts-liberation \
            libayatana-appindicator3-1 \
            libasound2 \
            libatk-bridge2.0-0 \
            libatk1.0-0 \
            libc6 \
            libcairo2 \
            libcups2 \
            libdbus-1-3 \
            libexpat1 \
            libfontconfig1 \
            libgbm1 \
            libgcc1 \
            libglib2.0-0 \
            libgtk-3-0 \
            libnspr4 \
            libnss3 \
            libpango-1.0-0 \
            libpangocairo-1.0-0 \
            libstdc++6 \
            libx11-6 \
            libx11-xcb1 \
            libxcb1 \
            libxcomposite1 \
            libxcursor1 \
            libxdamage1 \
            libxext6 \
            libxfixes3 \
            libxi6 \
            libxrandr2 \
            libxrender1 \
            libxss1 \
            libxtst6 \
            lsb-release \
            wget \
            xdg-utils \
            # p11-kit: fixes https://security-tracker.debian.org/tracker/CVE-2020-29362
            p11-kit \
    && npm config set unsafe-perm true \
    && npm install --only-production -g \
        resume-cli@3.0.6 \
        jsonresume-theme-stackoverflow@1.0.1


ENV RESUME_PUPPETEER_NO_SANDBOX true
WORKDIR /usr/local/lib