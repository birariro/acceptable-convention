#!/bin/sh

COMMIT_MSG_FILE=$1
FIRST_LINE=`head -n1 ${COMMIT_MSG_FILE}`

byPass() {

  if [[ $FIRST_LINE =~ ^(Merge branch) ]] ||
     [[ $FIRST_LINE =~ ^(Merge pull request) ]]; then

    echo "[commit lint pass] auto generated commit message"
    exit 0
  fi

  if [[ $FIRST_LINE =~ ^(initial) ]]; then
    echo "[commit lint pass] init commit message"
    exit 0
  fi
}

validHeader() {
  if [[ $FIRST_LINE == "" ]]; then
    echo "[commit lint error] empty commit message"
    exit 1
  fi


  if [[ $FIRST_LINE =~ (\.)$ ]]; then
    echo "[commit lint error] 문장 마지막의 ('.') 마침표를 제거"
    exit 1

  elif [[ ! $FIRST_LINE =~ ^(feat(\(.*\))?!?: ) ]] &&
      [[ ! $FIRST_LINE =~ ^(fix(\(.*\))?!?: ) ]] &&
      [[ ! $FIRST_LINE =~ ^(docs(\(.*\))?!?: ) ]] &&
      [[ ! $FIRST_LINE =~ ^(style(\(.*\))?!?: ) ]] &&
      [[ ! $FIRST_LINE =~ ^(refactor(\(.*\))?!?: ) ]] &&
      [[ ! $FIRST_LINE =~ ^(test(\(.*\))?!?: ) ]] &&
      [[ ! $FIRST_LINE =~ ^(chore(\(.*\))?!?: ) ]]; then

    echo "\n[commit lint error] HEADER 의 type, 콜론, 띄어쓰기 형태를 확인\n"

    echo "<type>(scope option): <subject>"
    echo "- feat: 신규 기능 추가"
    echo "- fix: 버그 수정"
    echo "- docs: 문서 수정"
    echo "- refactor: 코드 리펙토링"
    echo "- test: Test 관련한 코드 추가 혹은 수정"
    echo "- style: 코드의 수정 없이 스타일만 변경 (들여쓰기 수정, 세미콜론 누락 수정 등)"
    echo "- chore: 코드의 수정 없이 설정만 변경 (빌드 번호 수정, 패키지 매니저 수정 등)"
    exit 1

  fi
}

injectHeaderEmoji() {
  COMMIT_MESSAGE=`head ${COMMIT_MSG_FILE}`
  if [[ $FIRST_LINE =~ ^(feat.*) ]]; then
    NEW_COMMIT_MESSAGE="🚀 $COMMIT_MESSAGE"
  elif [[ $FIRST_LINE =~ ^(fix.*) ]]; then
    NEW_COMMIT_MESSAGE="🔥 $COMMIT_MESSAGE"
  elif [[ $FIRST_LINE =~ ^(docs.*) ]]; then
    NEW_COMMIT_MESSAGE="📝 $COMMIT_MESSAGE"
  elif [[ $FIRST_LINE =~ ^(style.*) ]]; then
    NEW_COMMIT_MESSAGE="🎨 $COMMIT_MESSAGE"
  elif [[ $FIRST_LINE =~ ^(refactor.*) ]]; then
    NEW_COMMIT_MESSAGE="🧠 $COMMIT_MESSAGE"
  elif [[ $FIRST_LINE =~ ^(test.*) ]]; then
    NEW_COMMIT_MESSAGE="🧪 $COMMIT_MESSAGE"
  elif [[ $FIRST_LINE =~ ^(chore.*) ]]; then
    NEW_COMMIT_MESSAGE="🍎 $COMMIT_MESSAGE"
  fi
  
  REST_OF_LINES=$(tail -n +2 "$COMMIT_MSG_FILE")
  MODIFIED_CONTENT="$NEW_COMMIT_MESSAGE\n$REST_OF_LINES"
  echo "$MODIFIED_CONTENT" > $COMMIT_MSG_FILE
}

byPass
validHeader
injectHeaderEmoji

echo "[commit lint pass] lint success"
exit 0
