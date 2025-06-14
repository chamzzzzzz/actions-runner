FROM ubuntu:22.04

WORKDIR /root/runner

RUN apt-get update && apt-get install -y curl git && apt-get clean

RUN curl -sS -o actions-runner-linux-x64-2.325.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.325.0/actions-runner-linux-x64-2.325.0.tar.gz && \
    echo "5020da7139d85c776059f351e0de8fdec753affc9c558e892472d43ebeb518f4  actions-runner-linux-x64-2.325.0.tar.gz" | shasum -a 256 -c && \
    tar xzf ./actions-runner-linux-x64-2.325.0.tar.gz && \
    rm -rf ./actions-runner-linux-x64-2.325.0.tar.gz

RUN ./bin/installdependencies.sh

COPY entrypoint.sh /root/runner/entrypoint.sh

CMD ["bash","/root/runner/entrypoint.sh"]
