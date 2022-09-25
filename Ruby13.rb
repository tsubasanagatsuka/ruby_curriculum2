
概要
この章では、Railsアプリにルーティングを設定する方法を学びます。
サーバーに届いたリクエストに対しどのような処理をするのかを決めましょう。

目的
ルーティングの役割と設定方法を理解すること
設定されているルーティングの確認方法を理解すること
ルーティング
リクエストの振り分け役として重要なルーティングについて学びます。

リクエストに応じて呼び出す処理を決めよう
Sinatraでも記述したルーティングをおさらいしましょう。
ルーティングとは、端的に言うとリクエストの行き先を指定する「道しるべ」です。

ルーティングはリクエストを振り分ける

クライアントからリクエストがあった際に、リクエストに対応した行き先を定義します。

トップページルーティング例

トップページへのルーティングを設定しよう
それでは、トップページに向けてのルーティングを設定しましょう。
Railsのルーティングは、configディレクトリの「routes.rb」に記述します。ルーティングの記述方法は以下の通りです。

【例】config/routes.rb
1
2
3
Rails.application.routes.draw do
 HTTPメソッド 'URIパターン', to: 'コントローラー名#アクション名'
end
「HTTPメソッド」では、GETやPOSTなどのリクエストの種類を表します。
「URIパターン」は、URLと同じようなものと捉えて構いません。リクエストのパスを表します。
to:に続く「コントローラー」と「アクション」については、リクエストに対応する処理を表すものです。こちらは次章で詳しく説明します。

ひとまずは、ルーティングを書いてみましょう。

 ルーティングを設定しましょう
まずはroutes.rbを以下のように編集しましょう。
2行目にFor details on the DSL available...といったコメントがありますが、こちらはアプリケーション開発上不要なため消しましょう。

config/routes.rb
1
2
3
Rails.application.routes.draw do
 get 'posts', to: 'posts#index'
end
今回は以下のようなルーティングを設定しました。

リクエスト
GETのHTTPメソッド（ただ単にトップページを表示するため）
URLはhttp://localhost:3000/posts
行き先
postsコントローラーという名前のコントローラー
indexアクションという名前のアクション
 現状の実装ではレスポンスの実装ができていないため、上記URLにアクセスしてもエラーが発生します。こちらは次章以降で実装しますので、このまま学習を進めていただいて問題ありません。
作業チェック
 get 'posts' to: 'posts#index'とルーティングを設定することができた
設定したルーティングを確認しよう
routes.rbにはルーティングが記載できましたが、しっかりとルーティングが設定されているかどうかは、rails routesコマンドを実行することで確認することができます。

 rails routesレイルズ ルーツコマンド
アプリケーションのディレクトリでrails routesコマンドを実行すると、
そのアプリケーションで設定されているルーティングを確認できます。

【例】ターミナル
1
2
3
4
5
6
# 作成したアプリケーションのディレクトリか確認（アプリ名「sample_app」の場合）
% pwd
/Users/ユーザー名/projects/sample_app

# 設定されているルーティングを確認
% rails routes
実際にコマンドを実行してルーティングを確認してみましょう。

 ルーティングを確認しましょう
ターミナルで以下のコマンドを実行しましょう。
ルーティングが表示されるので、ターミナルを画面幅いっぱいに広げて表示を確認しましょう。

ターミナル
1
% rails routes
以下のような表示がされれば正しくルーティングが設定できています。

【例】ターミナル
1
2
3
Prefix  Verb  URI Pattern       Controller#Action
posts   GET   /posts(.:format)  posts#index
（以下省略）
rails routesの実行結果は以下のように読むことができます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//ff8f666fdd63eafdd901a46f672da476.png

Prefixについては後のカリキュラムで説明します。
上記の結果から、config/routes.rbで記載した通りのルーティングが設定できていることがわかりました。

ブラウザでアプリを確認しよう
それでは、ルーティングを設定できたので、ブラウザで http://localhost:3000/posts にアクセスします。

 ブラウザでアプリにアクセスしましょう
まず、first_appのディレクトリで以下のコマンドを実行し、サーバーを起動しましょう。

ターミナル
1
% rails s
次に、以下にアクセスしましょう。すると赤いエラー画面が表示されるはずです。

http://localhost:3000/posts
こちらはRailsのエラー画面です。

https://tech-master.s3.amazonaws.com/uploads/curriculums//5745c956b2727cd8d6a6be8f9c16d93f.png

読んでみると2行目にuninitialized constant PostsControllerと書いてあります。
以下の図でわかるとおり、「ルーティングの後にあるはずのコントローラーが設定されていないよ」というエラーです。現状の段階ではエラー文の意味が理解できなくても問題ありません。

https://tech-master.s3.amazonaws.com/uploads/curriculums//5ec1d3a576520d93c61a8b2d37a21c8c.png

次のカリキュラムからは、このコントローラーの設定をしていきましょう。

