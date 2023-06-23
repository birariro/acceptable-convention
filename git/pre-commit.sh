#!/bin/sh

#--diff-filter=ACM 추가(Added), 복사(Added), 또는 수정(Modified)된 파일만 가져온다
#ghp_ : github personal access token
#sk- : chat-GPT API key

changed_files=$(git diff --cached --name-only --diff-filter=ACM | grep -v "^git/")
bad_keywords='ghp_|sk-'


if echo "$changed_files" | xargs grep -q -E "$bad_keywords"; then
    echo "[commit lint error] Found Bad Keywords in the changes. Please remove them before committing."
    echo "$changed_files" | xargs grep -n -E "$bad_keywords"
    exit 1
fi
