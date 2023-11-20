#!/bin/bash

set -eu

show_usage() {
    echo "Usage: ./app <command>"
    echo ""
    echo "  install        : installs application dependencies"
    echo "  uninstall      : uninstalls application"
    echo "  start          : starts application [Ctrl+C to stop]"
    echo "  stop           : stops application"
    echo "  artisan [...]  : runs artisan command"
    echo "  composer [...] : runs composer command"
    echo "  npm [...]      : runs npm command"
    echo ""
    exit 0
}

[ $# -eq 0 ] && show_usage

case $1 in
    "install" )
        docker compose run --rm composer install
        docker compose run --rm game-client npm install
        ;;
    "uninstall" )
        docker compose down --remove-orphans -v
        ;;
    "start" )
        docker compose down --remove-orphans
        docker compose up
        ;;
    "stop" )
        docker compose down --remove-orphans
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
