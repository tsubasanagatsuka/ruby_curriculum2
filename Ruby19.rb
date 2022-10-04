
概要
目的
投稿ページ作成
ルーティングを設定しよう
アクションを定義しよう
ビューを作成しよう
Railsのフォーム
HTMLのフォームを振り返ろう
ヘルパーメソッドについて学ぼう
ヘルパーメソッドの利点を学ぼう
フォームの作成
ビューにフォームを作成しよう
新規投稿ページへのリンクを作成しよう
フォーム作成の振り返り動画
動画でMVCの流れを確認しよう
練習問題
この章の振り返り
進捗度5 / 5
100%
このカリキュラムへのご要望
Ruby on Rails（FirstApp）
〜フォームを追加しよう〜
Capillas de marmolJavier Vieras - Marble cathedral inside
はじめに
概要
この章では、フォームを実装してブラウザからデータを送信できるようにする方法を学びます。

データの保存の仕組みは、Railsアプリケーションの中でも複雑に思うことが多いです。まずは動画でざっくりと全体の概要を掴んでから、実装に取り掛かりましょう。

 動画でデータ保存の大枠を掴みましょう

https://tech-master.s3.amazonaws.com/uploads/curriculums//e63e9c667a688a30f0b8f3d7f9bac27a.png

目的
ヘルパーメソッドの役割とメリットを理解すること
ヘルパーメソッドを用いたフォームの実装方法を理解すること
ヘルパーメソッドを用いたリンクの追加方法を理解すること
投稿ページ作成
本章の冒頭で以下の図を取り上げました。

https://tech-master.s3.amazonaws.com/uploads/curriculums//0c0f4fd0fb5b5e3c01b488dff7787c51.png

この章では、この内の第一段階、「新規投稿ページにアクセスする」を実装します。大枠の流れとしては、以下の3ステップです。

ルーティングでposts_controllerのnewアクションに行き先を指定する
posts_controllerのnewアクションを記述する
対応するビュー、new.html.erbを記述する
まず、ステップ1と2を実装していきましょう。

ルーティングを設定しよう
ルーティングの設定は、indexアクションのときと同様に記述します。
単純にフォームが記載されているページを表示するだけなので、HTTPメソッドにはGETを用います。

新規投稿を作成するページを表示する処理になるため、アクション名は、newアクションにします。

 ルーティングを設定しましょう
routes.rbを以下のように記述しましょう。

config/routes.rb
1
2
3
4
Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
end
rails routesを実行して、ルーティングが正しく設定できたことを確認しましょう。

【例】ターミナル
1
2
3
4
5
6
7
# 設定されているルーティングを確認
% rails routes

Prefix      Verb    URI Pattern           Controller#Action
posts       GET     /posts(.:format)      posts#index
posts_new   GET     /posts/new(.:format)  posts#new
（以下省略）
作業チェック
 get 'posts/new' to: 'posts#new'とルーティングを設定することができた
アクションを定義しよう
リクエストの行き先を指定することができたので、コントローラーに処理を記述しましょう。

indexアクションでは、データベースに入っている情報をすべて取り出すための処理の記述を行いました。
一覧データを表示する必要があるためです。

しかし、newアクションではアクションを定義するのみで、特に処理を記述する必要はありません。
なぜなら、新規投稿ページで入力フォームを表示させるだけであり、データの表示は行わないためです。

 アクションを定義しましょう
posts_controller.rbにnewアクションを定義しましょう。

app/controllers/posts_controller.rb
1
2
3
4
5
6
7
8
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end
end
作業チェック
 newアクションを定義することができた
ビューを作成しよう
コントローラーにnewアクションを定義できたので、対応するビューファイルを作成しましょう。

ビューはapp/views/コントローラー名ディレクトリに格納され、ファイル名はアクション名.html.erbとなります。したがって、今回作成するのは、app/views/posts/new.html.erbです。

 ビューファイルを作成しましょう
app/views/postsディレクトリに、new.html.erbを作成しましょう。

ビューファイル作成

 app
 views
 posts
 new.html.erb
 ビューファイルを編集しましょう
new.html.erbが新規投稿ページであるとわかるように記述しましょう。

app/views/posts/new.html.erb
1
<h1>新規投稿ページ</h1>
 ブラウザで確認しましょう
以下にアクセスして、確認しましょう。

http://localhost:3000/posts/new
以下のように、「新規投稿ページ」と表示されていれば成功です。

https://tech-master.s3.amazonaws.com/uploads/curriculums//004ca89b30e43cd576bbd3fcee372f22.png

ここまででステップ1と2が完了し、新規投稿ページの土台を作成することができました。
最後にステップ3として、new.html.erbを記述しましょう。投稿フォームを作成し、投稿内容を入力できるようにします。

Railsのフォーム
投稿ページでユーザーから情報を入力してもらえるように、Railsでフォームを作成する方法を学びます。

HTMLのフォームを振り返ろう
HTMLでフォームを記述するためには、以下のように<form>や<input>を用いることで実装できます。例を以下に示します。

【例】
1
2
3
4
5
6
<h1>新規投稿ページ</h1>

<form action="/posts" method="post">
  <input type="text" name="content">
  <input type="submit" value="投稿する">
</form>
action属性とは、リクエスト先のURLを指定する属性です。上記の例ではaction="/posts"と記載されていました。これは、ローカルサーバーで起動しているアプリケーションにおいてはlocalhost:3000/postsへ、フォームに記載した内容がリクエストとして送信されることを意味しています。
method属性とは、リクエストに使用されるHTTPメソッドを指定する属性です。上記の例ではmethod="post"と記載されています。これは、フォームに記載した内容を送信する際のHTTPメソッドとして、データを送信する際に使用するPOSTを指定していることを意味しています。

https://tech-master.s3.amazonaws.com/uploads/curriculums//9f348a7432494c97c987a8d55192a6f2.png

しかし、Railsでフォームを作成する際は、基本的に上記のような方法は用いません。
代わりにRailsアプリケーションではヘルパーメソッドというものを使用します。

ヘルパーメソッドについて学ぼう
Railsアプリケーションでは、ヘルパーメソッドというものを使用します。

 ヘルパーメソッド
Railsにおける、主にビューでHTMLタグを出現させたりテキストを加工するために使用するメソッドの総称です。

Railsにはじめから用意されているヘルパーメソッドの一例を紹介します。

ヘルパーメソッド	使用用途
form_with	投稿ページなどにおけるフォームの実装
link_to	リンクの実装
これ以外にもたくさんのヘルパーメソッドが存在します。自作することも可能です。

今回がフォームの実装なので、form_withメソッドを使用します。

 form_withフォームウィズメソッド
フォームを実装するためのヘルパーメソッドです。
HTMLのformタグの代わりに使用できます。

例えば、通常のHTMLであれば以下のように書くところを、

【例】HTMLのフォーム記述
1
2
3
4
<form action="/posts" method="post">
  <input type="text" name="content">
  <input type="submit" value="投稿する">
</form>
以下のように書きます。

【例】ヘルパーメソッドを用いたフォーム記述
1
2
3
4
<%= form_with url: "/posts", method: :post, local: true do |form| %>
  <%= form.text_field :content %>
  <%= form.submit '投稿する' %>
<% end %>
ヘルパーメソッドはRubyとして取り扱われるので、表示するために<%= %>で囲んで使用します。

form_withの詳細についてはこのあとの実装パートで説明します。

ヘルパーメソッドの利点を学ぼう
さて、上記の例を見るとヘルパーメソッドを使用してもあまり変わらないように見受けられますが、なぜヘルパーメソッドを使うのでしょうか？

それには以下のような理由があります。

パスの指定やRubyの埋め込みなどの記述がシンプルになるため
セキュリティ上の問題を解消するため
慣れるまでは難しく感じるかもしれませんが、基本的にヘルパーメソッドを使える部分はヘルパーメソッドを使用するべきです。すべてのヘルパーメソッドを覚える必要はありませんが、カリキュラムで使用するヘルパーメソッドは覚えておきましょう。

フォームの作成
ヘルパーメソッドについて概要を知ることができたので、投稿ページでヘルパーメソッドを利用して、フォームを作成します。

ビューにフォームを作成しよう
form_withを用いてフォームを実装します。
実装する前に、まずは下記のコードの例を参考にして、フォームの構造を理解しましょう。

【例】ヘルパーメソッドを用いたフォーム記述
1
2
3
4
<%= form_with url: "/posts", method: :post, local: true do |form| %>
  <%= form.text_field :content %>
  <%= form.submit '投稿する' %>
<% end %>
form_withを記述する大枠を理解しましょう
form_withは、doからendまでの間がフォームの記述になります。
したがって、do〜endの間に、表示される投稿フォームの内容を記述していきます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//73a71b4dda768842e6d52a6d2a4744eb.png

form_withに指定する引数について理解しましょう
【例】ヘルパーメソッドを用いたフォーム記述
1
2
3
4
<%= form_with url: "/posts", method: :post, local: true do |form| %>
  <%= form.text_field :content %>
  <%= form.submit '投稿する' %>
<% end %>
1行目のform_withの引数のurl: "/posts", method: :post, local: trueという記述はオプションと呼ばれ、それぞれフォームがどのような動作を行うかを決めています。

オプション名	説明
urlオプション	フォームの情報を送るリクエストのパスを指定
methodオプション	フォームの情報を送るリクエストのHTTPメソッドを指定。オプションの初期値は:postなので、postメソッドを指定する場合は省略することが可能
localオプション	リモート送信を無効にするかどうかを指定。trueにすると無効になる
form_withでは、デフォルトの状態ではリモート送信であるAjaxでの通信が行われる設定になっています。Ajaxについてはこの後のカリキュラムで学んでいきますが、現状ではこのAjax通信は必要のない機能です。それをキャンセルするためにlocal: trueというオプションを付与する必要があります。
urlオプションやmethodオプションは、先に説明したform要素のaction属性やmethod属性に対応するものです。この詳細は次章で学びます。

form_withでのフォームの部品の作り方を理解しましょう
【例】ヘルパーメソッドを用いたフォーム記述
1
2
3
4
<%= form_with url: "/posts", method: :post, local: true do |form| %>
  <%= form.text_field :content %>
  <%= form.submit '投稿する' %>
<% end %>
 form_withに指定されたurlやlocalなどの属性は次章で詳しく説明しますので、本章では割愛させていただきます。ここでは、form_withの実装方法だけ理解しておきましょう。
2~3行目の<%= form.text_field :content %>〜<%= form.submit '投稿する' %>という記述では、ビューに表示されるフォームの部品を生成しています。

form_withのブロック変数「form」とヘルパーメソッドを組み合わせることで、フォームに部品を追加できます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//978f897bd9a7defb8d4d1ed42f57d973.png

以下にフォームの部品を生成する主なヘルパーメソッドを示します。

こちらのヘルパーメソッドはWebで検索すればすぐにわかるものなので、覚える必要はありません。
「フォームに入力する内容によって、部品のヘルパーメソッドを使い分ける必要がある」ということだけ把握しておきましょう。

フォーム部品のヘルパーメソッド	用途例
text_field	1行のテキストボックス
password_field	パスワード入力ボックス（入力したテキストがアスタリスクなどに置き換えて表示される）
check_box	チェックボックス（複数選択可能）
radio_button	ラジオボタン（複数の中から1つしか選択できない）
submit	送信ボタン
この表のsubmitを除いて、これらのヘルパーメソッドの引数には、name属性にあたる名前が入ります。
name属性の値が、データを扱う際の名前であるキーになります。詳細は次の章で学習します。

 ビューファイルにフォームを追加しましょう
new.html.erbにフォームを追加しましょう。

今回form_withに指定するリクエストは、「POSTメソッド」・「/posts」という内容にします。対応するルーティングは次の章で作成します。

また、文章を投稿するフォームを用意するため、text_fieldを使用します。データを扱うキーは文章を意味する「content」にしましょう。

そして、投稿ボタンを用意するため、submitを使用します。

app/views/posts/new.html.erb
1
2
3
4
5
<h1>新規投稿ページ</h1>
<%= form_with url: "/posts", method: :post, local: true do |form| %>
  <%= form.text_field :content %>
  <%= form.submit '投稿する' %>
<% end %>
 ブラウザでアプリを確認しましょう
以下にアクセスして、フォームが記載できているか確認しましょう。

http://localhost:3000/posts/new
以下のように、表示されていれば成功です。

https://tech-master.s3.amazonaws.com/uploads/curriculums//e97fde09e844d7f73bcb656d884ac295.png

新規投稿ページへのリンクを作成しよう
ここまでで、新規投稿ページを作成することができました。次に、新規投稿ページにアクセスするためのリンクを作成します。

現状だとユーザーがhttp://localhost:3000/posts/newに直接アクセスしないと、新規投稿ページにアクセスすることができません。

したがって、リンクにリクエストの情報を埋め込み、リンクをクリックしたら新規投稿ページにアクセスできるようにしましょう。

リンクを作成するために、link_toというヘルパーメソッドを使用します。

 link_toリンクトゥーメソッド
リンクを作成するためのヘルパーメソッドです。HTMLのaタグの代わりに使用できます。

ビューファイルでは、以下のように記述します。
タグとして出力するため、<%= %>で囲う必要があります。

【例】リンク先をURLで指定する場合
1
<%= link_to 'リンクに表示する文字', 'リンク先のURL' %>
【例】リンク先をパスで指定する場合
1
<%= link_to 'リンクに表示する文字', 'パス', method: :HTTPメソッド %>
 ビューファイルにリンクを追加しましょう
まず、どのリクエストの情報を埋め込めば良いか考えましょう。rails routesを実行して、設定したルーティングを確認します。

ターミナル
1
2
3
4
5
6
7
8
# 設定されているルーティングを確認
% rails routes

Prefix      Verb    URI Pattern           Controller#Action
posts       GET     /posts(.:format)      posts#index
posts_new   GET     /posts/new(.:format)  posts#new

（以下省略）
今回、リクエストを送って動かしたいのは、get 'posts/new', to: 'posts#new'というルーティングです。

したがって、「GETメソッド」・「posts/new」というリクエスト情報を、リンク内に埋め込みます。
リンクに表示する文字は、「新規投稿」にします。

【例】link_to
1
<%= link_to '新規投稿', '/posts/new', method: :GET %>
link_toメソッドでパスを指定する場合、何も指定しなければデフォルトでGETメソッドが設定されます。
したがって、GETメソッドの指定を省略して記述することができます。

トップページであるindex.html.erbを以下のように修正しましょう。

app/views/posts/index.html.erb
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
<h1>トップページ</h1>
<%= link_to '新規投稿', '/posts/new' %>
<% @posts.each do |post| %>
  <div class="post">
    <div class="post-date">
      投稿日時：<%= post.created_at %>
    </div>
    <div class="post-content">
      <%= post.content %>
    </div>
  </div>
<% end %>
 ブラウザでアプリを確認しましょう
トップページにアクセスし、リンクが正常に動作することを確認しましょう。

http://localhost:3000/posts
以下のようにページが遷移すれば成功です。

https://tech-master.s3.amazonaws.com/uploads/curriculums//0d65a78cf897e856a1476441481d384a.gif

この章の実装では、以下の図における第一段階を実装しました。

https://tech-master.s3.amazonaws.com/uploads/curriculums//d3713df0f9a213c0e03065c4225e40bd.png

新規投稿フォームが完成したので、次は実際にフォームから送られてきたデータを、テーブルに保存するところまでを実装します。

フォーム作成の振り返り動画
動画でMVCの流れを確認しよう
本カリキュラムで、新規投稿ページを表示する機能を実装することができました。
以下の動画を視聴し、どのような流れで処理が行われているか確認しましょう。


練習問題
本章で学んだことを問題を解きながら復習しましょう。問題を解く際は、カリキュラムを見てはいけません。思い出すという行動をすることで、より一層の知識定着が可能となります。

不明点は次のカリキュラムに進む前に復習し、満点をとれるまで解き直しましょう。それまで次のカリキュラムに進まないようにしてください。以降のカリキュラムは、これまで学んだ内容が身についている前提で進むからです。

【練習問題 Ruby on Rails】フォームを追加しよう

この章の振り返り
要点チェック
 ヘルパーメソッドとは、主にビューでHTMLタグを出現させたりテキストを加工するために使用するメソッドのこと。
 form_withメソッドとは、フォームを実装するためのヘルパーメソッドのこと。
 link_toメソッドとは、リンクを追加するためのヘルパーメソッドのこと。


問題.1
フォームの実装
新規投稿フォームとして、以下のようにフォームを記述しました。しかしながら、このフォームには誤っている場所が2つあります。どこが誤っているか答えてください。

1
2
3
4
<%= form_with url: "/posts", method: :create, local: true do |form| %>
  <%= format.text_field :content %>
  <%= format.submit '投稿する' %>
<% end %>
回答
1
解答を貼り付けてください。
1
2
new
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
模範解答
1
2
①HTTPメソッドがcreateという存在しないメソッドになっている
②パイプで囲まれた変数（|form|）と、フォーム内のヘルパーで使用している変数が異なっている（formatになっている）
新規投稿をするときのHTTPメソッドはPOSTです。また、パイプで囲まれた変数名と、フォーム内のヘルパーで使用している変数名は一致する必要があります。

＊各3点　合計6点

この回答の点数を入力してください。
0
点配点6点
問題.2
リンクのためのヘルパーメソッド
以下のリンクを、ヘルパーメソッドlink_toで書き直してください。回答の際にはERBタグ（<%= %>）で囲ってください。

1
<a href="/posts/new">投稿ページ</a>
回答
1
解答を貼り付けてください。
1
2
<% link_to '投稿ページ', "/posts/new", method: posts/new %>
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
模範解答
1
<%= link_to '投稿ページ', '/posts/new' %>
link_toは<%= link_to 'リンクに表示する文字', 'リンク先のURL' %>という形で使用します。
