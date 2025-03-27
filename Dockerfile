FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y
RUN apt install python3-pip -y
RUN python3 -m pip config set global.break-system-packages true
RUN pip3 install mkdocs mkdocs-material mkdocs-macros-plugin pymdown-extensions mkdocs-mermaid2-plugin mkdocs-autolinks-plugin mkdocs-exclude
RUN python3 --version
RUN pip3 list

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
