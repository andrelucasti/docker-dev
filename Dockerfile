FROM eclipse-temurin:22-jdk-alpine

RUN apk add --no-cache bash &&  \
    apk add --no-cache curl &&  \
    apk add --no-cache jq &&  \
    apk add --no-cache git &&  \
    apk add --no-cache openssh &&  \
    apk add --no-cache iputils-ping && \
    apk add --no-cache gradle && \
    apk add --no-cache maven && \
    apk add --no-cache zsh && \
    apk add fzf --no-cache

# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" -- \
    -p git  \
    -p ssh-agent  \
    -p 'history-substring-search' \
    -p zsh-interacive-cd \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zdharma/fast-syntax-highlighting \
    -a 'export TERM=xterm-256color' \

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]
