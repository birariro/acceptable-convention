#!/bin/sh

COMMIT_MSG_FILE=$1
FIRST_LINE=`head -n1 ${COMMIT_MSG_FILE}`

# 자동 생성 pass
if [[ $FIRST_LINE =~ ^(Merge branch) ]] ||
   [[ $FIRST_LINE =~ ^Merge ]] ||
   [[ $FIRST_LINE =~ ^(initial) ]] ||
   [[ $FIRST_LINE =~ ^(Merge pull request) ]]; then
  exit 0
fi


if [[ $FIRST_LINE == "" ]]; then
  echo "[commit convention error] 커밋 메시지 입력 필요"
  exit 1
fi


if [[ $FIRST_LINE =~ (\.)$ ]]; then
  echo "[commit convention error] 문장 끝 마침표 제거"
  exit 1

elif [[ ! $FIRST_LINE =~ ^(feat(\(.*\))?!?: ) ]] &&
    [[ ! $FIRST_LINE =~ ^(fix(\(.*\))?!?: ) ]] &&
    [[ ! $FIRST_LINE =~ ^(docs(\(.*\))?!?: ) ]] &&
    [[ ! $FIRST_LINE =~ ^(style(\(.*\))?!?: ) ]] &&
    [[ ! $FIRST_LINE =~ ^(refactor(\(.*\))?!?: ) ]] &&
    [[ ! $FIRST_LINE =~ ^(test(\(.*\))?!?: ) ]] &&
    [[ ! $FIRST_LINE =~ ^Merge ]] &&
    [[ ! $FIRST_LINE =~ ^(chore(\(.*\))?!?: ) ]]; then

  echo "[commit convention error] HEADER 의 접두사, 콜론, 띄어쓰기 확인\n"
  echo "<type>(scope option): <subject>"
  echo "- feat: 기능 추가"
  echo "- fix: 버그 수정"
  echo "- docs: 문서 수정"
  echo "- style: 스타일(style)만 변경"
  echo "- refactor: 리펙토링"
  echo "- test: TEST 관련 추가, 수정"
  echo "- chore: 설정을 변경"
  echo "- Merge: merge commit"
  exit 1

else
  exit 0
fi

exit 0