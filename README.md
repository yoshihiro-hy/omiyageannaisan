## サービスURL
https://www.omiyageannaisan.com
## サービス概要
予定旅行先の宿泊先周辺のお土産を検索- 前日- 当日に通知するサービスです
## ターゲットユーザー
- ついお土産の購入を後回しにして旅行最終日に焦ってお土産を買うことになってしまう人
- 調べたお土産店までの行き方がわからない人
- 旅行に集中したくて、宿泊先周辺でお土産を見つけて楽をしたい人
## ユーザーが抱える課題
- つい旅行そのものを楽しむあまりにお土産を買うのを忘れがち
- 旅行中に買ったお土産を持ち歩くのが大変
## 解決方法
- お土産を買う日を設定してその前日と当日に通知することで思い出せるようにする
- 宿泊先周辺でお土産を検索して購入することで持ち歩く時間を少なくできる
## 実装予定機能
- ゲストユーザー(ログインしていない)
  - TOP画面の閲覧(サービス説明)
  - 宿泊先検索ページ
  - 宿泊先周辺お土産検索ページ
    - 店舗詳細ページ
  - 保存した店舗一覧ページ
  - ユーザー登録ページ
  - ログインページ
- ログインしているユーザー
  - TOP画面の閲覧(サービス説明)
  - 宿泊先検索ページ
    - 宿泊先周辺店舗検索ページ
      - 保存した店舗一覧ページ
        - 保存した店舗道案内機能
  - 保存した店舗を前日- 当日に通知(LINE通知を予定)
  - マイページ
    - プロフィールの変更
    - 宿泊先一覧ページ
      - 宿泊先詳細ページ
        - 保存した店舗一覧ページ
          - 保存した店舗道案内機能
- 管理ユーザー
  - ログインしているユーザーの検索、一覧、詳細、編集、削除
  - 管理ユーザーの一覧、作成、詳細、編集、削除
## MVPリリース以降の実装予定機能
宿泊先から駅または空港までの経路にあるお土産店検索機能
## なぜこのサービスを作ろうと思ったのか？
旅行をした際に荷物が増えるためお土産は後回しにされがちで、結局最終日に大きめな駅構内または空港内でお土産を購入することが多くせっかく現地にある限定のお土産を諦めなくてはいけない場面があったためです。それならあらかじめ購入予定のお土産を設定して、購入する予定日の前日- 当日に通知してくれるサービスがあれば助かる人もいると思ったからです。
## 画面遷移図
https://www.figma.com/file/81GGKNl6yoC4xvsIqxWCv7/%E3%81%8A%E5%9C%9F%E7%94%A3%E6%A1%88%E5%86%85%E3%81%95%E3%82%93%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1
## ER図
https://drive.google.com/file/d/13aM6ZJG5g1nnQnFzAYWLgoL8WJNoTlWw/view?usp=sharing
## スケジュール
- README,ER図作成,画面遷移図作成,技術調査: 11/8まで
- β版をRUNTEQ内リリース（MVP）：12/16
- 本番リリース: 1/4
