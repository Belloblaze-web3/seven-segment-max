#!/usr/bin/env bash

read -r test_cases

for ((case_no = 0; case_no < test_cases; case_no++)); do
    read -r number
    matchsticks=0

    for ((i = 0; i < ${#number}; i++)); do
        digit=${number:i:1}
        case "$digit" in
            0|6|9) matchsticks=$((matchsticks + 6)) ;;
            1)     matchsticks=$((matchsticks + 2)) ;;
            2|3|5) matchsticks=$((matchsticks + 5)) ;;
            4)     matchsticks=$((matchsticks + 4)) ;;
            7)     matchsticks=$((matchsticks + 3)) ;;
            8)     matchsticks=$((matchsticks + 7)) ;;
        esac
    done

    if (( matchsticks % 2 == 0 )); then
        printf '%*s\n' $((matchsticks / 2)) '' | tr ' ' '1'
    else
        printf '7'
        printf '%*s' $(((matchsticks - 3) / 2)) '' | tr ' ' '1'
        printf '\n'
    fi
done
