# swift-photos-11
iOS 연습 - 11팀(Min, Aiden)


## Step1

### 요구사항
* 스토리보드 ViewController에 CollectionView를 추가하고 Safe 영역에 가득 채우도록 frame을 설정한다.

* CollectionView Cell 크기를 80 x 80 로 지정한다.

* UICollectionViewDataSource 프로토콜을 채택하고 40개 cell을 랜덤한 색상으로 채우도록 구현한다.

### 실행결과

<img width="406" alt="스크린샷 2021-03-22 오후 6 17 34" src="https://user-images.githubusercontent.com/69951890/111967003-e158f680-8b3a-11eb-8f81-7aae9986db77.png">

### 완성날짜
* 2021-03-22


## Step2

### 요구사항
* UINavigationController를 Embed시키고, 타이틀을 'Photos'로 지정한다.

* PHAsset 프레임워크를 사용해서 사진보관함에 있는 사진 이미지를 Cell에 표시한다.

* PHCachingImageManager 클래스를 활용해서 썸네일 이미지를 100 x 100 크기로 생성해서 Cell에 표시한다.

* PHPhotoLibrary 클래스에 사진보관함이 변경되는지 여부를 옵저버로 등록한다.


### 실행결과

![Simulator Screen Shot - iPhone 12 - 2021-03-24 at 14 47 47](https://user-images.githubusercontent.com/73586326/112262801-93b2ca00-8cb1-11eb-8aaa-4ee1a92a16d8.png)

### 완성날짜
* 2021-03-24

## Step3

### 요구사항
* Bundle에서 doodle.json 파일을 읽어와서 스위프트 데이터 구조로 변환한다.

* GCD 큐를 활용해서 동시에 최대한 효율적으로 여러 이미지를 다운로드 받아서 표시한다.

* +(add) 버튼을 누르면 Modal로 CollectionViewController에서 상속받은 새로운 DoodleViewController를 표시한다.

    * 반드시 코드로 NavigationController를 embed 한 상태로 present 시킨다.

* 이미지를 전부 다운로드할 때까지 기다리지않고, 버튼을 누르는 즉시 ViewController 화면을 보여준다.

* DoodleViewController 에서 특정 셀을 롱클릭하면 실행화면처럼 Save 액션을 하는 UIMenuItem을 표시한다.

### 실행결과

<img width="401" alt="스크린샷 2021-03-26 오후 2 25 54" src="https://user-images.githubusercontent.com/69951890/112586454-2e8cdf00-8e3f-11eb-9191-5f4e882dd0db.png">

<img width="436" alt="스크린샷 2021-03-26 오후 2 24 30" src="https://user-images.githubusercontent.com/69951890/112586337-fbe2e680-8e3e-11eb-92c3-1369f37d78b1.png">
