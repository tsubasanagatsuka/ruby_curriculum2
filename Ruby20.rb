
概要
目的
投稿完了ページ作成
ルーティングを設定しよう
アクションを定義しよう
ビューを作成しよう
保存機能の実装
データの流れを学ぼう
アクションに保存の処理を書こう
完成形の確認
データ保存の振り返り動画
動画でデータの保存を理解しよう
動画でMVCの流れを確認しよう
練習問題
この章の振り返り
進捗度4 / 4
100%
このカリキュラムへのご要望
Ruby on Rails（FirstApp）
〜フォームから送信されたデータを保存しよう〜
Capillas de marmolJavier Vieras - Marble cathedral inside
はじめに
概要
この章では、フォームから送信されたデータをテーブルに保存する方法を学びます。

この作業が終われば、FirstAppは完成です。もうひと踏ん張りです！

目的
フォームによってブラウザからデータを追加する方法を理解すること
パラメーターの役割を理解すること
投稿完了ページ作成
新規投稿ページにフォームを記載するところまで完了しました。この章ではいよいよ、フォームから送られたデータをテーブルに追加できるよう実装します。

今回の実装は、下図における第二段階の部分です。

https://tech-master.s3.amazonaws.com/uploads/curriculums//60b64ab634c5edc93fe78a748bcd5f50.png

大枠の流れとしては、以下の4ステップです。

ルーティングでposts_controllerのcreateアクションに行き先を指定する
posts_controllerにcreateアクションを定義する
対応するビュー、create.html.erbを記述する
定義したposts_controllerのcreateアクション内に、保存機能の記述をする
まず、ステップ1~3を実装していきましょう。

ルーティングを設定しよう
まずはルーティングの設定をして、「データを投稿する」というリクエストがあった場合の処理の振り分けをしましょう。

今回は新規投稿ページから、データが投稿されてテーブルに登録する際の実装をします。したがって、HTTPメソッドはPOSTを選択することになります。

アクション名は、投稿内容を保存してレコードを作成する処理を行うことから、createアクションにします。

 ルーティングを設定しましょう
routes.rbを以下のように記述しましょう。

config/routes.rb
1
2
3
4
5
Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
end
上記が記載できたら、ターミナルでrails routesコマンドを実行して、ルーティングが正しく設定できているか確認します。

【例】ターミナル
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

Prefix      Verb  URI Pattern           Controller#Action
posts       GET   /posts(.:format)      posts#index
posts_new   GET   /posts/new(.:format)  posts#new
            POST  /posts(.:format)      posts#create
（以下省略）
上記のように表示されれば成功です。

今回作成したルーティングは以下です。

POST /posts(.:format)

また、直前のカリキュラムで記載したフォーム冒頭では以下のように記述していました。

【例】app/views/posts/new.html.erb
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
フォームから情報を入力して投稿すると、form_withで指定してあるリクエスト先に情報が送られます。

今回は、form_withにPOSTメソッド・「/posts」というリクエスト先を指定しています。
したがって、今回作成したcreateアクションに振り分けられるルーティングが動きます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//9ab804fd56ed130312fe744786b16c73.png

作業チェック
 post 'posts' to: 'posts#create'とルーティングを設定することができた
アクションを定義しよう
ルーティングが設定できたので、コントローラーにアクションを定義します。

 アクションを定義しましょう
posts_controller.rbにcreateアクションを定義しましょう。

app/controllers/posts_controller.rb
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
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
  end
end
ここではとりあえず、空のcreateアクションだけを定義します。

作業チェック
 createアクションを定義することができた
ビューを作成しよう
createアクションに対応するビューファイルを作成しましょう。

 ビューファイルを作成しましょう
app/views/postsディレクトリに、create.html.erbを作成しましょう。

 app
 views
 posts
 create.html.erb
 ビューファイルを編集しましょう
create.html.erbは、投稿完了ページになるビューです。
トップページに戻るリンクも用意しておきましょう。

app/views/posts/create.html.erb
1
2
<h1>投稿が完了しました</h1>
<%= link_to 'トップページに戻る', '/posts' %>
ここまででステップ1~3が完了し、データをテーブルへ追加する大枠の流れは出来ました。
最後にステップ4として、posts_controller.rbへ保存機能の記述をしましょう。

保存機能の実装
データの流れを学ぼう
フォームが送信された際のデータの流れについて知識を深めましょう。

ブラウザからユーザーがフォームを送信したとき、サーバーに情報を渡すために、リクエストにはパラメーターを含めることができます。

 パラメーター
リクエストに含まれてサーバーの外部から渡されるデータのことです。
URLに含めるパラメーターやフォームから送信されるパラメーターがあります。

Railsのコントローラーにたどり着くパラメーターは、paramsというハッシュのようなものに格納されて、届けられます。

 paramsパラムス
送られてきたパラメーターをハッシュのような構造で格納したものです。
フォームで送信されたデータもparamsの中に格納されてコントローラーで受け取られます。

text_fieldの後に記載されたキーでparamsに格納されています。
フォームで入力された情報の値は、params[:キー名]として取り出すことができます。

例えば、「content」というキーで、「おはよう」というデータをフォームで送信したとします。
すると、paramsに{content: おはよう}といったハッシュのような構造で格納されます。
コントローラーでparams[:content]と記述すると、「おはよう」というデータを取り出すことができます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//62fdcf98a9ec4e3685613be09b63bd4d.png

アクションに保存の処理を書こう
現在なにも処理が書かれていないcreateアクションに、保存の処理を記述しましょう。

保存には、モデルのsaveメソッドを使用していましたが、
今回はより便利なcreateメソッドを使用します。

 createクリエイトメソッド
モデルが使用できるActiveRecordメソッドのひとつです。

保存のために、new→情報を記述→saveとしていたところが、createメソッドの引数を記述して実行するだけで保存できます。

【例】
1
モデル.create(カラム名: 値)
たとえば、今回はpostsテーブルのcontentというカラム名に、params[:content]の情報を保存します。その場合は、以下のような書き方です。
https://tech-master.s3.amazonaws.com/uploads/curriculums//e94956b7a5d9ecebf22a8b26c04884f5.png

 paramsの情報を保存できるようにしましょう
posts_controller.rbのcreateアクションに、保存の処理を記述しましょう。

app/controllers/posts_controller.rb
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
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(content: params[:content])
  end
end
フォームから送信されたパラメーターを利用して、createメソッドの引数に記述しました。

これで、保存の処理は完成です。

完成形の確認
さあ、これでFirstAppは完成です！最後に動作確認をして終わりましょう。

 ブラウザでアプリの動作を確認しましょう
実際に投稿してみて、トップページに戻り、投稿ができているか確認しましょう。
以下のように投稿と閲覧ができれば成功です。

https://tech-master.s3.amazonaws.com/uploads/curriculums//a550458e8710f391ea481bd91dc8a382.gif

データ保存の振り返り動画
動画でデータの保存を理解しよう
データを保存する方法について、動画で一連の作業を振り返りましょう。


動画でMVCの流れを確認しよう
本カリキュラムで、データを投稿して保存する機能を実装することができました。
以下の動画を視聴し、どのような流れで処理が行われているか確認しましょう。


練習問題
本章で学んだことを問題を解きながら復習しましょう。問題を解く際は、カリキュラムを見てはいけません。思い出すという行動をすることで、より一層の知識定着が可能となります。

不明点は次のカリキュラムに進む前に復習し、満点をとれるまで解き直しましょう。それまで次のカリキュラムに進まないようにしてください。以降のカリキュラムは、これまで学んだ内容が身についている前提で進むからです。

【練習問題 Ruby on Rails】フォームから送信されたデータを保存しよう

この章の振り返り
要点チェック
 パラメーターとは、リクエストに含まれてサーバーの外部から渡されるデータのこと。
 paramsとは、送られてきたパラメーターをハッシュのような構造で格納したもの。
 本LESSONで作成したアプリケーションは、今後のカリキュラムでも使用することがあります。削除はしないでください。再度同じアプリケーションを作成したい場合は、rails newを実行する際に、別のアプリケーション名を設定しましょう。

問題.1
データの保存
フォームからのデータを保存するために、以下のようにコードを書きました。しかしながら、ある2つの誤りが原因でデータが正しく保存できません。
なぜそのような問題が生じているのか、それぞれ答えてください。

app/views/posts/new.html.erb

1
2
3
4
5
<h1>新規投稿ページ</h1>
<%= form_with url: "/posts", method: :post, local: true do |form| %>
  <%= form.text_field :context %>
  <%= form.submit '投稿する' %>
<% end %>
config/routes.rb

1
2
3
4
5
Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
end
app/controllers/posts_controller.rb

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
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.new(content: params[:content])
  end
end
回答
1
解答を貼り付けてください。
1
2
Post.create
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
模範解答
1
2
① text_fieldで指定した値がcontextになっているが、コントローラーで受け取っているパラメーターはparams[:content]であるため
② Post.newでインスタンス（レコード）を生成しただけで保存していないため
①については、問題で提示したフォームでは、params[:content]の中身は空っぽです。データをコントローラーで受け取るためには、params[:context]とするか、<%= form.text_field :content %>と修正します。名前は揃えた方がわかりやすいので、とくに意図がなければ後者の方が望ましいでしょう。

②については、1行で書くのであればPost.create(content: params[:content])として、インスタンスの生成と保存を一度に行ってしまうことが望ましいでしょう。一方で、以下のように記述しても、データは保存できます。

1
2
3
4
def create
  post = Post.new(content: params[:content])
  post.save
end