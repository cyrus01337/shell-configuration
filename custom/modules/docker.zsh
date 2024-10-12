#!/usr/bin/env bash
USER_IN_DOCKER_GROUP=$(id -nG "$USER" | grep docker)

silence() {
    command $1 &> /dev/null;
}

if silence which docker; then
    alias d="docker"
    alias dc="docker compose"
    alias dcb="dc build"
    alias dcr="dc down && dc up"
    alias docker-images="docker image ls"

    ollama() {
        echo "Preparing Ollama..."

        using_existing_container=false
        ollama_container_id="$(docker ps --format '{{.ID}}' --filter 'name=ollama')"

        if [[ "$ollama_container_id" ]]; then
            using_existing_container=true

            echo "Using existing Ollama container..."
        else
            if [[ $(docker start ollama) ]]; then
                echo "Starting Ollama container..."
            else
                echo "Pulling Ollama image from Docker Hub..."
                docker pull ollama/ollama:rocm

                echo "Starting new Ollama container..."
                silence docker run \
                    -d \
                    -v ollama:/root/.ollama \
                    -p 11434:11434 \
                    --device /dev/kfd \
                    --device /dev/dri \
                    --name ollama \
                    ollama/ollama:rocm
            fi

            ollama_container_id="$(docker ps --format '{{.ID}}' --filter 'name=ollama')"
        fi

        docker exec -it ollama ollama $@

        if [[ $using_existing_container = false ]]; then
            echo "Stopping Ollama container..."
            silence docker stop ollama
        fi
    }

    silence docker image ls

    if [[ $? =~ 0 && -f /.dockerenv && "$USER_IN_DOCKER_GROUP" ]]; then
        # There is a bug within devcontainers where if it uses
        # docker-outside-of-docker, running any Docker command fails despite
        # being assigned to the Docker group, so we modify the permissions of
        # the Docker socket only when inside a Docker/dev container
        silence sudo chmod 666 /run/docker.sock
    fi
fi
