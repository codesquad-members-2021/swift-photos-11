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
