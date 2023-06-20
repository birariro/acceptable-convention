# java

## acceptable-java-formatter
intellij 전용 xml 파일

아래의 컨벤션을 참고
- https://google.github.io/styleguide/javaguide.html
- https://github.com/naver/hackday-conventions-java/blob/master/rule-config/naver-intellij-formatter.xml

대표 적용 컨벤션
- import 패키지별 정리
- 들여쓰기 2칸
- IDE 오른쪽 여백 120 자
- 제어문, 반복문 한줄 금지, 괄호 생략 금지

### java code convention 적용

```
1. Preferences / Editor / Code Style -> Schema 에서 import schema 로 ./share/local/acceptable-java-formatter.xml 추가
2. Preferences / tool / Actions On Save -> Reformat Code, Optimize imports 체크
```