require 'sinatra'

# ルートパスへアクセスしたときのルーティング
get '/hello' do
  # 変数sampleに"こんにちは"という文字列を代入する
  sample = "ぽこぽこ"
  # 変数sampleに代入された値をブラウザに表示する
  "<p>TestText#{sample}</p>"
end


概要
本章では、簡易的なアプリケーションを実装して、前章で学習したリクエストとレスポンスの処理を体験します。



プログラミングをする上で、リクエストとレスポンスの理解は避けて通ることはできません。

なぜなら、これらの理解が浅い状態では、どこでどのような処理が行われているか把握することが難しいからです。このような状態でプログラミング学習を進めるのは非効率と言えるでしょう。
逆にリクエストとレスポンスの理解ができていれば、全体把握が容易になります。

本章でリクエストとレスポンスの処理が理解できることをゴールに、学習を進めていきましょう。

目的
簡易的なWebアプリケーション作成を体験して、リクエストとレスポンス処理の全体像を理解すること

リクエストとレスポンスの処理をRubyで記述し、サーバーを起動するまでの一連の流れを理解すること

簡易アプリケーションの実装
本章で作成する簡易Webアプリケーションには、Sinatraという仕組みを使用します。

Sinatraシナトラ
Sinatraとは、最小の労力でRubyによるWebアプリケーションを作成できる仕組みを構築できるフレームワークのことです。

フレームワークとは「最小のコストでWebアプリケーションの作成ができるような仕組み」のことです。詳しくは次章で学習しますので、本章では「Webアプリケーション開発の速度を比較的上げることができる仕組みである」ということだけ認識しておいてください。

動画で一連の流れを予習しましょう
簡易的なWebアプリケーション作成の全体像を把握するために、以下の動画を視聴しましょう。


簡易的なWebアプリケーションの実装
先ほど学習したSinatraを用いて、簡易的なWebアプリケーションを作成し、リクエストとレスポンスの処理を実際に体験します。
実際に簡易的なWebアプリケーションを作成していきましょう。

Sinatraを読み込もう
これからSinatraを使用するために以下2つの準備を行います。

gem installコマンドでSinatraをご自身のPCにインストールする
requireメソッドを用いて、1でインストールしたSinatraを読み込む
ここで新しく出てきたrequireについては後ほど紹介します。

Rubyのファイルを作成しましょう
Sinatraという名前のディレクトリを作成し、その配下にmyApp.rbというRubyファイルを作成してください。

作成ができたら、VScodeで作成したSinatraディレクトリを開きましょう。

 SinatraをPCにインストールしましょう
ターミナルを開きSinatraというディレクトリで下記のコマンドを実行しましょう。

ターミナル
1
gem install sinatra
 このとき、「sinatra」とsが小文字であることに注意してください。
下記のように出力されればインストール成功です。

ターミナル（出力例）
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
13
14
15
16
17
18
19
$ gem install sinatra
Fetching: rack-protection-2.1.0.gem (100%)
Successfully installed rack-protection-2.1.0
Fetching: ruby2_keywords-0.0.2.gem (100%)
Successfully installed ruby2_keywords-0.0.2
Fetching: mustermann-1.1.1.gem (100%)
Successfully installed mustermann-1.1.1
Fetching: sinatra-2.1.0.gem (100%)
Successfully installed sinatra-2.1.0
Parsing documentation for rack-protection-2.1.0
Installing ri documentation for rack-protection-2.1.0
Parsing documentation for ruby2_keywords-0.0.2
Installing ri documentation for ruby2_keywords-0.0.2
Parsing documentation for mustermann-1.1.1
Installing ri documentation for mustermann-1.1.1
Parsing documentation for sinatra-2.1.0
Installing ri documentation for sinatra-2.1.0

Done installing documentation for rack-protection, ruby2_keywords, mustermann, sinatra after 567 seconds
コマンドの実行結果はPCの環境によって異なるため、まったく同じでなくとも問題ありません。
ターミナルのログに「Error」と出ていないかだけ確認しましょう。

 myApp.rbにSinatraを読み込みましょう
先ほど作成したmyApp.rbファイルにSinatraを読み込む記述をしましょう。
Sinatraのような仕組みをRubyファイルに読み込む際はrequireメソッドを使用します。

requireリクワイアメソッド
Rubyのファイルで、Sinatraのような仕組み自体を読み込む際に使用する記述です。
require '読み込む対象'と記述すると読み込むことができ、「読み込む対象」の処理を、記述したRubyファイルで使用できるようになります。

上記を踏まえて、myApp.rbファイルにSinatraを読み込む記述を追加してください。

sinatra/myApp.rb
1
2
# PCにインストールしたSinatraをmyApp.rbに読み込む
require 'sinatra'
 先ほどと同様に、「sinatra」とsが小文字であることに注意してください。
これでSinatraを利用することができるようになりました。

リクエスト処理を実装しよう
リクエストとレスポンスを処理する記述を行う前に、ルーティングとHTTPメソッドについてそれぞれ理解しておきましょう。

ルーティング
ルーティングとは、リクエストに対してどのような処理を実行するかという道筋を明記する仕組みです。

https://tech-master.s3.amazonaws.com/uploads/curriculums//ac7c1a27c5d1a275aed3213154d03473.png

リクエストを処理し、それに応じてどのプログラムを実行するかを設定します。

 HTTPエイチティーティーピーメソッド
HTTPメソッドとは、HTTP通信における処理の種類のことを指します。

HTTP通信とは、Webアプリケーションを表示する際の、情報やデータなどを送受信するための通信方法でした。



この通信には、Webアプリケーションで使用する処理の種類ごとに8つの種類が存在します。このような、HTTP通信の中で行いたい処理の種類をHTTPメソッドといいます。

本章では、頻繁に使用する4つのHTTPメソッドを紹介します。

メソッド	処理
GET	取得する
POST	送信する、作成する
PUT	更新する、作成する
DELETE	削除する
上記を踏まえて、今回使用するHTTPメソッドを考えましょう。
今回行いたいことは、「localhost:4567にアクセスすることで、指定のページが表示される」実装です。これは「リクエストを送ると、レスポンスとしてHTMLが表示される」と言い換えることができます。

つまり、今回はHTMLの情報を取得することが目的なので、使用するHTTPメソッドはGETであることがわかります。

リクエスト処理を追記しましょう
リクエストの処理を追記します。
Rubyの構文として<HTTPメソッド> '<URL>' doで開始し、endで終了します。
今回はHTTPメソッドがGETで、URLが「/」のルーティングを設定します。

以下のようにmyApp.rbファイルに記述しましょう。

sinatra/myApp.rb
1
2
3
4
5
6
7
# PCにインストールしたSinatraを読み込む
require 'sinatra'

# ルートパスへアクセスしたときのルーティング
get '/' do
  # ここに処理を記述する
end
GETメソッドでルートパスにリクエストしたときのルーティングを設定しました。ルートパスにアクセスした際はdo〜endの中に記述された処理が実行されます。

【補足】
sinatraでは、パスを自由に設定できます。

たとえば以下の場合、HTTPメソッドはGET、URLは「/hello」となります。

sinatra/myApp.rb
1
2
3
4
5
6
7
# PCにインストールしたSinatraを読み込む
require 'sinatra'

# ルートパスへアクセスしたときのルーティング
get '/hello' do
  # ここに処理を記述する
end
次にdo〜endの間へ、処理とレスポンス内容を記述します。

レスポンスを決めよう
先ほどの記述で、リクエストを受け取る処理は実装できました。

次に、レスポンスとして何を返却するのかという処理を記述します。

レスポンス内容を追記しましょう
下記のように追記しましょう。

sinatra/myApp.rb
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
# PCにインストールしたSinatraを読み込む
require 'sinatra'

# ルートパスへアクセスしたときのルーティング
get '/' do
  # 変数sampleに"こんにちは"という文字列を代入する
  sample = "こんにちは"
  # 変数sampleに代入された値をブラウザに表示する
  "<p>TestText#{sample}</p>"
end
7行目は、一般的なRubyの記述です。
“こんにちは"という文字列を、変数sampleに代入しました。

9行目は、返却するHTMLのbody部分の中身部分を記述しています。
さらに、文字部分にRubyの式展開を使用しています。

pタグの「TestTextこんにちは」という文字が、返却されるHTMLのbody内に入ります。

動作させてみよう
それでは早速、Webアプリケーションを動作させてみましょう。

 rubyコマンドで、myApp.rbファイルに記述したソースコードを実行しましょう
下記のコマンドを、Sinatraディレクトリで実行してください。

ターミナル
1
ruby myApp.rb
下記のような状態になれば、サーバーの起動は成功です。

ターミナル
1
2
3
4
[2020-06-16 10:51:05] INFO  WEBrick 1.4.2
[2020-06-16 10:51:05] INFO  ruby 2.6.5 (2019-10-01) [x86_64-darwin19]
== Sinatra (v2.0.8.1) has taken the stage on 4567 for development with backup from WEBrick
[2020-06-16 10:51:05] INFO  WEBrick::HTTPServer#start: pid=10046 port=4567
なお== Sinatra (v2.0.8.1) has taken the stage on 4567 for development with backup from Pumaで始まる結果になっても問題はありません。

myApp.rbファイルを実行すると、Webアプリケーションのサーバーが起動している状態になります。

この状態でローカルホストに接続します。

ローカルホスト（localhost）
ローカルホストとは「自分のPC」という意味です。本来であれば世界中のどこかに、アプリケーション専用のサーバーを立ち上げるのですが、今回はあくまで開発途中なので自分のPC内にサーバーを立ち上げています。

https://tech-master.s3.amazonaws.com/uploads/curriculums//c92ed5955c3b1b120c8a5cdb62ff76ab.png

今回はlocalhost:4567にアクセスすることで、起動したサーバーに接続できます。
なお、ローカルホストはあくまで自分のPCの中にあるものなので、他の人がlocalhost:4567へアクセスしても、自分のアプリケーションを見てもらうことはできません。

 ブラウザでアクセスしてみましょう
ローカルホスト4567へアクセス

上記をクリックし、起動しているWebアプリケーションにアクセスしてみましょう。

そして、設定したリクエストやURL、またはレスポンス（返却されるHTML）が記述通りになっているか確認します。
下記のような画面が表示されれば成功です。

https://tech-master.s3.amazonaws.com/uploads/curriculums//56e18586568c58076c7ebd1f8dd49293.png

 control + Cコマンドでサーバーを停止しましょう
ターミナルでcontrol + Cを同時に押し、サーバーを停止しましょう。
プロンプト%が表示されてコマンドが実行できる状態になれば、サーバーが停止できています。
サーバーが停止すると、下記画像のようにサーバー内のWebアプリケーションにアクセスできなくなります。

https://tech-master.s3.amazonaws.com/uploads/curriculums//e4f05db59d9005a41c2ae8386bda5cb6.gif

ルート以外のパスでブラウザにアクセスしてみよう
上記の実装ではルートパスにアクセスしたときの処理を記述しました。
しかし、別のパスを設定することもできます。
ルートパス以外のパスでも、Webアプリケーションが動作するか確認しましょう。

パスを指定しましょう
GETメソッドで「/hello」というパスにアクセスした時の処理を記述します。
以下のようにパスを修正してください。

sinatra/myApp.rb
1
2
3
4
5
6
require 'sinatra'

get '/hello' do
  sample = "こんにちは"
  "<p>TestText#{sample}</p>"
end
変更を反映しましょう
修正したコードの内容は、サーバーを停止した上で再起動しないと反映されません。
一度control + Cをしてサーバーが停止したのを確認した上で、以下のコマンドを実行してください。

ターミナル
1
ruby myApp.rb
パスを指定してブラウザにアクセスしましょう
ルートパスの場合はlocalhost:4567にアクセスすることで、 起動したサーバーに接続できました。
今回はlocalhost:4567/helloにアクセスすることで、起動したサーバーに接続できます。

では、ブラウザにアクセスして文字が正しく表示されるか確認しましょう。
localhost:4567/helloに接続して、以下の表示がされれば成功です。
https://tech-master.s3.amazonaws.com/uploads/curriculums//ffe546584ac47edad482b77fb2f6809e.png

アクセスするパスを間違えた場合、以下のようなエラーが出ます。
localhost:4567/hellowというように誤ったパスでアクセスした場合、以下のようなエラーが表示されます。
エラーが出た場合は、正しいパスでアクセスできているか確認しましょう。

https://tech-master.s3.amazonaws.com/uploads/curriculums//c4e1250be25142e3779891a26a78fa85.gif

