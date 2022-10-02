コントローラー
リクエストに対応する処理を定義しよう
ルーティングによって、リクエストに対してどのような処理を行うか設定しました。
現在は、その処理がまだ存在していない状態です。

リクエストに対応する処理を記述しておくコントローラーを学びましょう。

 コントローラー
コントローラーは、MVCの役割の1つです。
リクエストに対応する処理をまとめて用意しておき、ルーティングからリクエストを受け取って処理を行った後、クライアントにレスポンスを返します。

コントローラーは、MVCにおける橋渡しの役割も持っています。
レスポンスに必要となるデータがあれば、他の役割と連携してデータを取得したり受け渡しを行い、レスポンスを完成させます。

ルーティングの先にあるコントローラー

コントローラーを作成しよう
FirstAppにコントローラーを用意しましょう。
Railsに必要なファイルを生成するには、rails gコマンドを使用します。

 rails gレイルズ ジーコマンド
Railsアプリに追加で必要なファイルなどを生成するために使用するコマンドです。
rails gに続けて、生成したいファイルの種類とファイル名を記述します。

【例】Railsに必要なファイルを生成
1
2
# ファイルを生成する
% rails g ファイルの種類 生成するファイル名
実行して生成されるファイルは、1つとは限りません。
必要な関連するファイルも同時に生成してくれます。

gは英語で「生成する」を意味するgenerateの略です。こちらのコマンドはWebで検索すればすぐにわかるものなので、覚える必要はありません。

コントローラーを作成するには、rails g controllerコマンドを使用します。

 rails g controllerレイルズ ジー コントローラーコマンド
コントローラーやそれに付随するファイルを一度に作成してくれるコマンドです。以下のような形で実行します。

【例】
1
2
# コントローラーを作成
% rails g controller コントローラー名
コントローラーの命名規則は、複数形を使用することです。
たとえば、本の情報を処理する場合は「books」、顧客の情報を処理する場合は「clients」という名前になります。

 postsコントローラーを作成しましょう
rails g controllerコマンドを実行して、postsコントローラーを作成します。
今回はコントローラーの名前は「投稿」を意味するpostという英単語を使い「postsコントローラー」にしたいと思います。以下のコマンドを実行しましょう。

ターミナル
1
2
3
4
5
# first_appディレクトリにいることを確認
% pwd

# postsコントローラーを作成
% rails g controller posts
 サーバーを起動している場合は、一度サーバーを終了するか、command[⌘]+Tで新しいターミナルのタブを用意してからrails gコマンドを実行しましょう
コマンドを実行して以下のような処理が表示されれば成功です。

【例】ターミナル
1
2
3
4
5
6
7
Running via Spring preloader in process 24861
     create  app/controllers/posts_controller.rb
     invoke  erb
     create    app/views/posts
     invoke  test_unit
     create    test/controllers/posts_controller_test.rb
     invoke  helper
createは「生成したファイル」という意味です。invokeは生成したファイルに関連するフレームワークの機能を表しています。

createで記載されているファイルを必ずしも使用するわけではありません。ここではcreateで記載されているファイルの中の、posts_controller.rbに注目しましょう。

以下のようにapp/controllers/posts_controller.rbが生成されているか確認しましょう。

コントローラー確認

中身はまだ2行ほどのクラスの記述しか書かれていません。この中に、リクエストに対応する処理を書いていきます。

今回は使用しませんが、生成とは逆の削除を行うrails dコマンドも合わせて学んでおきましょう。
作業チェック
 rails g controller postsとコマンドを実行して、posts_controller.rbファイルを作成することができた
 rails dレイルズ ディーコマンド
rails gコマンドで生成したファイル一式をすべて削除するコマンドです。つまり、rails dコマンドは、rails gコマンドとは逆の動作を行うものと言えます。

1つのファイルだけではなく、関連するファイルも一気に削除してくれるので、不要なファイルが残ってしまうことを回避できます。

【例】生成したファイル一式を削除
1
2
# rails gコマンドで生成したファイル一式を、rails dコマンドで削除
% rails d ファイルの種類 削除するファイル名
dは英語で「破壊する」を意味するdestroyの略です。こちらのコマンドはWebで検索すればすぐにわかるものなので、覚える必要はありません。

たとえばコントローラーを削除したい場合は、rails d controller コントローラー名を実行するだけで、関連ファイルを削除してくれます。
今回のコントローラーを削除する場合、rails d controller postsになります。

【例】ターミナル
 1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
Running via Spring preloader in process 25942
     remove  app/controllers/posts_controller.rb
     invoke  erb
     remove    app/views/posts
     invoke  test_unit
     remove    test/controllers/posts_controller_test.rb
     invoke  helper
     remove    app/helpers/posts_helper.rb
     invoke    test_unit
     invoke  assets
     invoke    scss
     remove      app/assets/stylesheets/posts.scss
名前を間違ってしまったときなど、必要になれば使用しましょう。

コントローラーにアクションを定義しよう
コントローラーの作成ができました。コントローラーは、リクエストに対応する処理を記述する場所です。実際に処理を用意しましょう。

コントローラーの処理はアクションとして分類されます。

 アクション
コントローラー内における、処理のカテゴリーのことです。
アクションは、コントローラーにインスタンスメソッドとして定義します。

どの動作を行うかによって、種類が分かれます。

アクション名	どのような時に動くか
index	一覧表示ページを表示するリクエストに対応して動く
new	新規投稿ページを表示するリクエストに対応して動く
create	データの投稿を行うリクエストに対応して動く
show	個別詳細ページを表示するリクエストに対応して動く
edit	投稿編集ページを表示するリクエストに対応して動く
update	データの編集を行うリクエストに対応して動く
destroy	データの削除を行うリクエストに対応して動く


今回は、トップページを表示するためのアクションを記載したいです。
トップページを表示するためには上記の中からindexアクションを用います。

 indexアクションを定義しましょう
posts_controller.rbを開き、以下のように記述しましょう。

app/controllers/posts_controller.rb
1
2
3
4
5
6
class PostsController < ApplicationController

 def index  # indexアクションを定義した
 end

end
indexという名前のインスタンスメソッドを定義するだけです。
これで、ルーティングに対応するアクションを用意することができました。

ここで今一度、ルーティングの記述を振り返ってみましょう。

【例】config/routes.rb
1
2
3
Rails.application.routes.draw do
 get 'posts', to: 'posts#index'
end
このルーティングは、「postsというパスに、GETメソッドでリクエストが送られてきたとき、postsコントローラーのindexアクションを呼び出す」という設定であることがわかります。

コントローラーとアクションを用意したので、現状のアプリの動作をブラウザで確認してみましょう。

作業チェック
 indexアクションを定義することができた
ブラウザでアプリを確認しよう
現状のアプリケーションの状態を確認してみます。

 ブラウザでアプリにアクセスしましょう
以下のリンクからアプリケーションにアクセスしましょう。サーバーが起動していない場合は、rails sでサーバーを起動してからアクセスしましょう（すでにターミナルの別タブで起動している場合、再度起動する必要はありません）。

http://localhost:3000/posts
すると、以下のようなエラー画面が表示されます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//a587682372cfc61dc08a61bcd17cb74f.png

No template for interactive requestと表示されていますが、これは「ビューファイルがないよ」というエラーです。いまの段階ではエラー文の意味が理解できなくても問題ありません。

Railsの流れをおさらいしてみましょう。

https://tech-master.s3.amazonaws.com/uploads/curriculums//f2babbf881d6bdeb118fa45a7c8b6331.png

コントローラーの後にはビューが呼び出されます。まだビューファイルは作成していないので、このようなエラーが出たのですね。それでは次のカリキュラムから、ビューを整備していきましょう。

