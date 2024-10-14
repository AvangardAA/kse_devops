#!/bin/bash

F="addr.txt"

add_c()
{
    echo "Name: " && read name
    echo "Ph. number: " && read phone
    echo "Email: " && read email
    echo "$name | $phone | $email" >> "$F" && echo "Done"
}

search_c()
{
    echo "Input name, ph. number or email" && read input
    echo "Result: " && grep -i "$input" "$F" || echo "nothing found"
}

case "$1" in
    add)
        add_c
        ;;
    search)
        search_c
        ;;
    remove)
        remove_c
        ;;
    *)
        echo "Input: $0 (add, search, remove)"
        exit 1
        ;;
esac
