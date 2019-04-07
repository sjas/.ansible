#!/bin/bash

sed     "/^num.*/                                                               s//$(printf "\033[33m&\033[0m")/                " | \
\
sed     "/ DROP/                                                                s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/REJECT/                                                               s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/reject-with.*/                                                        s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/ACCEPT/                                                               s//$(printf "\033[32;1m&\033[0m")/              " | \
sed     "/RETURN/                                                               s//$(printf "\033[33;1m&\033[0m")/              " | \
\
sed     "/FORWARD\w*/                                                           s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/FWD\w*/                                                               s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/IN\w*/                                                                s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/OUT\w*/                                                               s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/f2b-sshd/                                                             s//$(printf "\033[34;1m&\033[0m")/              " | \
\
sed     "/INVALID/                                                              s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/RELATED/                                                              s//$(printf "\033[32;1m&\033[0m")/              " | \
sed     "/ESTABLISHED/                                                          s//$(printf "\033[32;1m&\033[0m")/              " | \
sed     "/NEW/                                                                  s//$(printf "\033[33;1m&\033[0m")/              " | \
sed     "/UNTRACKED/                                                            s//$(printf "\033[33;1m&\033[0m")/              " | \
\
sed     "/Chain[[:space:]][[:graph:]]*/                                         s//$(printf "\033[34;1m&\033[0m")/              " | \
\
sed     "/\([ds]pt[s]\?:\)\([[:digit:]]\+\(:[[:digit:]]\+\)\?\)/                s//$(printf "\\\1\033[33;1m\\\2\033[0m")/       " | \
sed     "/\([ds]ports\? \)\([[:digit:]]\+\(:[[:digit:]]\+\)\?\)/                        s//$(printf "\\\1\033[33;1m\\\2\033[0m")/       " | \
sed     "/\([0-9]\{1,3\}\\.\)\{3\}[0-9]\{1,3\}\(\\/\([0-9]\)\{1,3\}\)\{0,1\}/   s//$(printf "\033[37;1m&\033[0m")/g             " | \
sed     "/[a-f0-9:]\{2,\}\/[[:digit:]]\{1,3\}/					s//$(printf "\033[37;1m&\033[0m")/g             " | \
\
sed     "/\([^n][[:space:]]\)\(LOGDROP\)/                                       s//$(printf "\\\1\033[1;31m\\\2\033[0m")/       " | \
sed     "/[[:space:]]LOG[[:space:]]/                                            s//$(printf "\033[36;1m&\033[0m")/              "

