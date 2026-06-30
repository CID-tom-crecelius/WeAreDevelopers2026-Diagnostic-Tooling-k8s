FROM mcr.microsoft.com/dotnet/sdk:10.0

RUN dotnet tool install --global dotnet-dump \
    && dotnet tool install --global dotnet-gcdump \
    && dotnet tool install --global dotnet-trace \
    && dotnet tool install --global dotnet-counters \
    && dotnet tool install --global dotnet-stack \
    && dotnet tool install --global dotnet-sos

ENV PATH="${PATH}:/root/.dotnet/tools"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       procps \
       less \
       lsof \
       strace \
       gdb \
       iproute2 \
       dnsutils \
       net-tools \
       tar \
       bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /diagnosticArtifacts

CMD ["sleep", "infinity"]

