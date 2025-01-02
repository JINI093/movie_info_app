# 🎬 영화정보 앱

## 💡 프로젝트 소개
내일배움캠프 Flutter_5기 심화 개인 과제
클린 아키텍처를 기반으로 외부 Api를 활용하는 프로그램입니다.

### ⏱️ 프로젝트 기간

`2024. 12. 27 - 2025. 1. 2`


### 🛠️ 개발 환경

| Technologies | Tools                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 언어         | <img src="https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=dart&logoColor=white">                                                                                                                                                                                                                                                                                                                                                              |
| 에디터       | <img src="https://img.shields.io/badge/VSCode-199ED9?style=for-the-badge">                                                                                                                                                                                                                                                                                                                                                                                                                                            |
### 🗂️ 디렉토리 구조

<details>
  <summary> (Click!)디렉토리 구조 </summary>
📦lib
 ┣ 📂Ui
 ┃ ┣ 📂screens
 ┃ ┃ ┣ 📜detail_screen.dart
 ┃ ┃ ┗ 📜home_screen.dart
 ┃ ┣ 📂view_model
 ┃ ┃ ┣ 📂detail
 ┃ ┃ ┃ ┣ 📜detail.dart
 ┃ ┃ ┃ ┣ 📜detail_state.dart
 ┃ ┃ ┃ ┗ 📜detail_view_model.dart
 ┃ ┃ ┣ 📂home
 ┃ ┃ ┃ ┣ 📜home.dart
 ┃ ┃ ┃ ┣ 📜home_state.dart
 ┃ ┃ ┃ ┗ 📜home_view_model.dart
 ┃ ┃ ┗ 📜view_model.dart
 ┃ ┗ 📂widgets
 ┃ ┃ ┣ 📜movie_card.dart
 ┃ ┃ ┗ 📜movie_list_section.dart
 ┣ 📂core
 ┃ ┣ 📂config
 ┃ ┃ ┗ 📜app_config.dart
 ┃ ┣ 📂constants
 ┃ ┃ ┗ 📜api_constants.dart
 ┃ ┣ 📂di
 ┃ ┃ ┗ 📜injection.dart
 ┃ ┣ 📂error
 ┃ ┃ ┗ 📜failures.dart
 ┃ ┣ 📂network
 ┃ ┃ ┗ 📜network_info.dart
 ┃ ┣ 📂util
 ┃ ┃ ┗ 📜result.dart
 ┃ ┗ 📜core.dart
 ┣ 📂data
 ┃ ┣ 📂data_source
 ┃ ┃ ┣ 📜data_source.dart
 ┃ ┃ ┣ 📜movie_data_source.dart
 ┃ ┃ ┗ 📜tmdb_movie_data_source.dart
 ┃ ┣ 📂dto
 ┃ ┃ ┣ 📜dto.dart
 ┃ ┃ ┣ 📜movie_detail_dto.dart
 ┃ ┃ ┗ 📜movie_response_dto.dart
 ┃ ┣ 📂repository
 ┃ ┃ ┣ 📜movie_repository_impl.dart
 ┃ ┃ ┗ 📜repository.dart
 ┃ ┗ 📜data.dart
 ┣ 📂domain
 ┃ ┣ 📂model
 ┃ ┃ ┣ 📜model.dart
 ┃ ┃ ┣ 📜movie.dart
 ┃ ┃ ┗ 📜movie_detail.dart
 ┃ ┣ 📂repository
 ┃ ┃ ┣ 📜movie_repository.dart
 ┃ ┃ ┗ 📜repository.dart
 ┃ ┣ 📂use_case
 ┃ ┃ ┣ 📜base_use_case.dart
 ┃ ┃ ┣ 📜get_movie_detail_use_case.dart
 ┃ ┃ ┣ 📜get_now_playing_movies_use_case.dart
 ┃ ┃ ┣ 📜get_popular_movies_use_case.dart
 ┃ ┃ ┣ 📜get_top_rated_movies_use_case.dart
 ┃ ┃ ┣ 📜get_upcoming_movies_use_case.dart
 ┃ ┃ ┗ 📜use_case.dart
 ┃ ┗ 📜domain.dart
 ┗ 📜main.dart

</details>

## 💡 어떻게 사용하나요?

### 실행 화면

| ![login](https://velog.velcdn.com/images/utiranoj/post/d8c1072b-8e14-48f4-a8f6-17696150e4dd/image.gif) | ![home-chat](https://velog.velcdn.com/images/utiranoj/post/c31300c9-c6de-46b0-89f5-555debb414a1/image.gif) | ![run](https://velog.velcdn.com/images/utiranoj/post/5a431ddc-d869-4418-9cfe-9801e3f9bde3/image.gif) |
| ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |

> 홈

- 가장 인기있는 영화, 현재 상영중, 인기순, 평점 높은순, 개봉 예정 영화를 List로 보여줍니다.
- 각 영화 포스터를 누르면 자세한 영화 정보를 볼 수 있습니다.
- 각 데이터는 실시간으로 변합니다.

> 디테일 페이지

- `영화 제목` `개봉일`
- `태그라인`
- `러닝타임`
- `카테고리` 들
- `영화설명`
- `평점` `평점투표수` `인기점수` `예산` `수익` 가로 리스트뷰
- `제작사` 이미지 가로 리스트뷰 형식으로 볼 수 있습니다.
