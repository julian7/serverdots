alias dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'"

function dex() {
    docker exec -ti "$1" "${2:bash}"
}
