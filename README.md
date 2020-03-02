### README.md



- 구디아카데미 과제를 위해 만들었던 개인블로그 저장소입니다.



### GitHub 사용방법

> Forking WorkFlow

1. git 설치
2. 해당 프로젝트 Fork(해당 깃허브 페이지 우측 상단 버튼 클릭)
   - git repository fork를 하여 개인 git 계정에 repository를 생성한다.
3. Clone or download 버튼을 클릭하여 나오는 주소 복사 = url
4. 개인 remote repository를 Local로 clone 합니다.

```
ex) git clone git@https://github.com/ajossi/SampleSpring.git
```

1. public repository를 Upstream remote로 추가합니다.
   - origin, upstream remote가 생성된 것을 확인할 수 있습니다.

```
git remote add upstream git@github.com:J511Y/Goodee-algostudy.git
git remote -v
```

1. Branch를 생성합니다.

```
 git checkout -b [branchName]
```

1. 소스 코드를 생성, 수정 한 후 commit 를 생성합니다.

- commit은 [이름][주차.스터디주제]간략한 커밋 내용
- ex) [김제니][1.DP]1101문제 수정

```
git commit -m "[김제니][1.DP]1101문제 수정"
```

1. 개인 Remote Repository에 해당 브랜치를 push 합니다.
   - push 전 git fetch upstream를 통해 Upstream Repository의 최신 변경사항과 일치시킵니다.

```
 git push origin 
```

1. 개인 Remote Repository에서 간단한 코멘트와 함께 Pull Request를 생성합니다.
2. git에서는 한글 파일명을 제공하지 않습니다. 터미널에서 한글 파일명이 깨져보이는 현상 제거

```
git config --global core.quotepath false 
```