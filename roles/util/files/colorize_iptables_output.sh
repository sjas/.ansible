#!/bin/bash

# table header
sed     "/^num.*/                                                               s//$(printf "\033[33m&\033[0m")/                " | \
sed     "/^\s\+pkts.*/                                                          s//$(printf "\033[33m&\033[0m")/                " | \
\
# chains
# special chain names so 'Chain' will not be renamed
sed     "/\([^n]\s\)\(LOGDROP\)/                                                s//$(printf "\\\1\033[1;31m\\\2\033[0m")/       " | \
sed     "/\([^n]\s\+\)\(MY_\w\+\)/                                              s//$(printf "\\\1\033[1;34m\\\2\033[0m")/       " | \
sed     "/Chain\s\+\S\+/                                                        s//$(printf "\033[34;1m&\033[0m")/              " | \
\
# targets
sed     "/ DROP  /                                                              s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/ REJECT/                                                               s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/reject-with.*/                                                        s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/ ACCEPT/                                                               s//$(printf "\033[32;1m&\033[0m")/              " | \
sed     "/ RETURN/                                                               s//$(printf "\033[33;1m&\033[0m")/              " | \
sed     "/\s\[goto\]/                                                           s//$(printf "\033[31m&\033[0m")/                " | \
\
# chain names
sed     "/\sNODE/                                                               s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/\sFORWARD\w*/                                                         s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/\sFWD\w*/                                                             s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/\sIN\w*/                                                              s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/\sOUT\w*/                                                             s//$(printf "\033[34;1m&\033[0m")/              " | \
sed     "/\sf2b-sshd/                                                           s//$(printf "\033[34;1m&\033[0m")/              " | \
\
# ct states
sed     "/INVALID/                                                              s//$(printf "\033[31;1m&\033[0m")/              " | \
sed     "/RELATED/                                                              s//$(printf "\033[32;1m&\033[0m")/              " | \
sed     "/ESTABLISHED/                                                          s//$(printf "\033[32;1m&\033[0m")/              " | \
sed     "/NEW/                                                                  s//$(printf "\033[36;1m&\033[0m")/              " | \
sed     "/UNTRACKED/                                                            s//$(printf "\033[36;1m&\033[0m")/              " | \
\
# ports
sed     "/\([ds]pt[s]\?:\)\([0-9A-Za-z]\+\([,:][0-9A-Za-z]\+\)\?\)/             s//$(printf "\\\1\033[33;1m\\\2\033[0m")/g      " | \
sed     "/\([ds]ports\? \)\([0-9A-Za-z]\+\([,:][0-9A-Za-z]\+\)\?\)/             s//$(printf "\\\1\033[33;1m\\\2\033[0m")/g      " | \
\
# flags
sed     "/\(flags:\)\(\S\+\)/                                                   s//$(printf "\\\1\033[35;1m\\\2\033[0m")/       " | \
sed     "/\(ipv6-icmptype \)\(\S\+\)$/                                          s//$(printf "\\\1\033[36;1m\\\2\033[0m")/       " | \
sed     "/\(ipv6-icmp \)\(\S\+\)$/                                              s//$(printf "\\\1\033[36;1m\\\2\033[0m")/       " | \
\
# src/dst
sed     "/anywhere/                                                             s//$(printf "\033[37;1m&\033[0m")/g             " | \
sed     "/\([0-9]\{1,3\}\\.\)\{3\}[0-9]\{1,3\}\(\\/\([0-9]\)\{1,3\}\)\{0,1\}/   s//$(printf "\033[37;1m&\033[0m")/g             " | \
sed     "/\s[a-f0-9:]\{2,\}[:/][[:digit:]a-f]\{1,4\}\s/                         s//$(printf "\033[37;1m&\033[0m")/g             " | \
\
sed     "/\sLOG\s/                                                              s//$(printf "\033[34;1m&\033[0m")/              "

