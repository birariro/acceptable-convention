# git

## commit-msg
git commit message 의 컨벤션 검사

아래의 컨벤션을 참고
- https://www.conventionalcommits.org/en/v1.0.0/

대표 적용 컨벤션
- commit message 해더에는 feat, fix, docs, style, refactor, test, chore 만 허용
- 브랜치 이름을 header/ticket/name 로 작성시 ticket 을 파싱하여 git commit msg 하단에 명시

### git commit message convention 적용

```shell
chmod +x git/commit-msg.sh
chmod +x git/prepare-commit-msg.sh

cp git/commit-msg.sh <your product path>/.git/hooks/commit-msg
cp git/prepare-commit-msg.sh <your product path>/.git/hooks/prepare-commit-msg
```
<br/>

