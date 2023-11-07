#!/bin/bash

set -eu

show_usage() {
    echo "Usage: ./app <command>"
    echo ""
    echo "  install: installs application dependencies"
    echo "  artisan: runs artisan command"
    echo "  composer: runs composer command"
    echo "  npm: runs npm command"
    echo ""
    exit 0
}

[ $# -eq 0 ] && show_usage

case $1 in
    "install" )
        docker compose run --rm composer install
        docker compose run --rm game-client npm install
        ;;
    "artisan" )
        shift
        docker compose run --rm game-server php artisan "$@"
        ;;
    "composer" )
        shift
        docker compose run --rm composer "$@"
        ;;
    "npm" )
        shift
        docker compose run --rm game-client npm "$@"
        ;;
    * )
        show_usage
        ;;
esac
