FROM ubuntu

WORKDIR /root/runner

RUN apt-get update && apt-get install -y curl git && apt-get clean

RUN curl -sS -o actions-runner-linux-x64-2.308.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.308.0/actions-runner-linux-x64-2.308.0.tar.gz && \
    echo "9f994158d49c5af39f57a65bf1438cbae4968aec1e4fec132dd7992ad57c74fa  actions-runner-linux-x64-2.308.0.tar.gz" | shasum -a 256 -c && \
    tar xzf ./actions-runner-linux-x64-2.308.0.tar.gz && \
    rm -rf ./actions-runner-linux-x64-2.308.0.tar.gz

RUN ./bin/installdependencies.sh

COPY entrypoint.sh /root/runner/entrypoint.sh

CMD ["bash","/root/runner/entrypoint.sh"]

