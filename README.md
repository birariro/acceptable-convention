# acceptable-convention
<br/>

### git commit message convention 적용

- https://www.conventionalcommits.org/en/v1.0.0/
```shell
chmod +x git/commit-msg.sh
cp git/commit-msg.sh <your product path>/.git/hooks/commit-msg
```
<br/>


### java code convention 적용

- https://google.github.io/styleguide/javaguide.html
- https://github.com/naver/hackday-conventions-java/blob/master/rule-config/naver-intellij-formatter.xml

```
1. Preferences / Editor / Code Style -> Schema 에서 import schema 로 ./share/local/acceptable-java-formatter.xml 추가
2. Preferences / tool / Actions On Save -> Reformat Code, Optimize imports 체크
```