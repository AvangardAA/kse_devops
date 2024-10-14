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

remove_c()
{
    echo "Input name, ph. number or email" && read input
    tmp=$(mktemp)
    grep -i -v "$input" "$F" > "$tmp"

    if [ -s "$tmp" ]; then
        mv "$tmp" "$F" && echo "removed"
    elif grep -i -q "$input" "$F"; then
        > "$F" && rm -f "$tmp"
    else
        echo "nothing found" && rm -f "$tmp"
    fi
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
