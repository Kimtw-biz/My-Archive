# Taewook Kim's portfolio Web App

Taewook Kim의 플러터 기반 포트폴리오 웹앱 프로젝트

## Table of Contents
1. [Package Usage](#1-package-usage)
2. [State Management](#2-state-management) 
3. [Folder Structure](#3-folder-structure)
3. [External Links](#4-external-links)

## 1. Package Usage
* My Library
    - App Bar 스크롤 인디케이터, Auto Layout 등 프로젝트에서 사용하는 Widget 관련 패키지

* BLoC Library
    - 프로젝트의 주 상태 관리를 위한 패키지

* Cloud Firestore
    - 프로젝트의 Database를 위한 패키지

* Firebase Storage
    - 프로필, 이미지 및 문서 저장을 위한 패키지

## 2. State Management
본 프로젝트에서는 상태관리를 위해 BLoC Library를 사용하였습니다.

* Layout Size Bloc
    - 브라우저 크기에 따른 Responsive View를 위해 현재 브라우저 사이즈를 제공하기 위한 컴포넌트.
    <br/><br/>*내부 컨텐츠 뷰의 최대 사이즈는 가독성을 위해 1440픽셀로 제한 되어 있습니다.

* CareersBloc
    - Database에 등록되어 있는 최신의 경력 및 프로젝트 정보를 Data repository에서 가져와 제공

* Profile Bloc
    - Database에 등록되어 있는 가장 최신의 프로필 정보를 Data repository에서 가져와 제공

* Tech Stack Bloc
    - Database에 등록되어 있는 가장 최신의 기술스택 정보를 Data repository에서 가져와 제공

* Page Cubits
    - 각 모듈의 페이지의 로직과 그에 필요한 데이터를 제공. 필요한 경우 여러 Bloc 컴포넌트의 상태를 구독하여 처리

## 3. Folder Structure
* Cores
    - Blocs
        - 프로젝트 전역에서 독립적으로 사용 가능한 BLoC 컴포넌트 관련 폴더

    - Localizations
        - 현지화 관련 파일 관련 폴더.
        - 본 프로젝트에서는 플러터 기본 현지화를 사용하였습니다.

    - Navigations
        - 프로젝트의 네비게이션 관련 파일 폴더
        - 본 프로젝트는 Single Page로 제작되어 Home Page가 Shell 역할을 하고 있습니다.

    - Services
        - Firebase와 같이 서드 파티 로직 관련 폴더

    - Tokens
        - Colors, Sizes, Themes 등 프로젝트에 필요한 각종 토큰 관련 폴더

    - Values
        - Icon, Image, Constants 등 프로젝트에서 사용하는 정적인 데이터 관련 폴더

* Datas 
    - Clients
        - 백엔드로부터 HTTP요청을 수행하는 클라이언트 관련 폴더.

    - Repositories
        - 각 클라이언트로부터 데이터를 제공받아 프로젝트에서 사용가능한  데이터로 가공하여 BLoC에 제공하는 데이터 레포지토리 관련 폴더.

    - Enums
        - 열거형 데이터 관련 폴더.

    - Models
        - 데이터 모델 관련 폴더.

* Modules
<br/>하나의 화면을 구성하는 여러 UI 컴포넌트와 해당 모듈에서 종속적으로 사용하는 로직의 집합
    - blocs
        - 해당 모듈에서 종속적으로 사용하는 로직 컴포넌트

    - components
        - 가장 작은 단위의 UI 컴포넌트

    - compositions
        - 여러 Component의 집합으로 구성된 UI 컴포넌트

    - forms
        - UI 컴포넌트에서 공통으로 사용가능한 폼

    - views
        - 여러 Component와 Composition의 집합으로 구성된 View

    - page
        - 해당 페이지에서 사용하는 로직컴포넌트를 주입하고, View를 제공

* Screens
<br/>Snack Bar, Drawer와 같이 프로젝트 전역에서 사용하는 View 또는 Page 관련 폴더

* Widgets
<br/>프로젝트 전역에서 사용하는 Componenet 및 Composition 관련 폴더

## 4. External Links
- [Hosting 1: My Archive ](https://myarchive-75f55.web.app/)
- [Hosting 2: My Archive](https://myarchive-75f55.firebaseapp.com/)
- [Figma: My Archive Draft](https://www.figma.com/design/ubjj6qqQX1OtNfcegSFXal/Draft%2FPublic%2FMyArchive?node-id=0-1&t=v5gCcSvY0tHMHgY5-1)
- [Package: Flutter My Library](https://github.com/Kimtw-biz/My-Library)
- [Document: Portfolio](https://firebasestorage.googleapis.com/v0/b/myarchive-75f55.appspot.com/o/cvs%2F20240617_%E1%84%80%E1%85%B5%E1%86%B7%E1%84%90%E1%85%A2%E1%84%8B%E1%85%AE%E1%86%A8_%E1%84%80%E1%85%A2%E1%84%87%E1%85%A1%E1%86%AF_%E1%84%91%E1%85%A9%E1%84%90%E1%85%B3%E1%84%91%E1%85%A9%E1%86%AF%E1%84%85%E1%85%B5%E1%84%8B%E1%85%A9.pdf?alt=media&token=2fd37cae-1c82-4a89-82dd-2ab9afddf69b)