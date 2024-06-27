FROM debian:bookworm

RUN apt update && \
    apt install -y git-lfs gnupg2 less texlive-latex-recommended texlive-latex-extra \
                   default-jre wget && \
    # Install ltex-ls for spell-check in latex
    wget -q https://github.com/valentjn/ltex-ls/releases/download/15.2.0/ltex-ls-15.2.0.tar.gz -O /opt/ltex-ls-15.2.0.tar.gz && \
    tar xzf /opt/ltex-ls-15.2.0.tar.gz -C /opt && \
    useradd --shell /bin/bash --create-home latex-user

USER latex-user
