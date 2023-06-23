# git

- pre-commit : 커밋 메시지 작성 전
- prepare-commit-msg : 커밋 메시지 편집기를 실행하기 전 
- commit-msg : 커밋 메시지 완성후 커밋 완료 전

### git commit message convention 적용

```shell
chmod +x git/commit-msg.sh
chmod +x git/prepare-commit-msg.sh
chmod +x git/pre-commit.sh

cp git/commit-msg.sh <your product path>/.git/hooks/commit-msg
cp git/prepare-commit-msg.sh <your product path>/.git/hooks/prepare-commit-msg
cp git/pre-commit.sh <your product path>/.git/hooks/pre-commit
```
<br/>

