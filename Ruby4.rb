
input = gets

puts "入力した値は#{input}です"

概要
この章では、入力機能と出力機能を学びます。
対話的にアプリケーションを動かす仕組みと使い方を学びましょう。

目的
出力機能の実装方法を理解すること
入力機能の実装方法を理解すること
文字列末尾の改行を取り除く方法を理解すること
バックスラッシュ記法を理解すること
事前準備
サンプルコード用のRubyファイルを作成しよう
学習に使用するRubyファイルを作成します。

新規Rubyファイルを作成しましょう
以下のように、rubyディレクトリに「input.rb」というファイルを作成してください。

 ホームディレクトリ
 ruby
 input.rb
入力機能と出力機能
作成中のseconds.rbは入力された分単位の時間を、秒数に変えて表示するアプリです。
つまり、分単位の時間を入力する機能と、秒数を出力する機能が必要です。

2つの機能を扱えるようになりましょう。

ターミナルに値を出力しよう
ターミナルへ値を出力するには、putsメソッドを使用します。

putsプッツメソッド
Rubyに用意された、ターミナルに値を出力するメソッドです。
putsに続けて値を記述すると、その値をターミナルに出力します。

【例】putsメソッド
1
2
3
4
name = "Taro"

# ターミナルに出力する
puts name
【例】ターミナル
1
2
# nameの値が出力される
=> "Taro"
input.rbを以下のように編集しましょう
それでは、実際にコードを書きましょう。input.rbを以下のように編集します。

ruby/input.rb
1
2
3
input = "こんにちは"

puts "入力した値は#{input}です"
ターミナルでinput.rbを実行しましょう
記述したRubyのファイルを、ターミナルで実行します。まずは、pwdコマンドを実行して、/Users/（ユーザー名）/rubyのディレクトリにいることを確認します。もしこのディレクトリにいない場合は、本LESSONの最初の章を参考に、移動しましょう。

https://tech-master.s3.amazonaws.com/uploads/curriculums//930ff7f3eaaca9e3be90bb7c1ca4aa65.gif

続いて、input.rbを実行するために、ruby input.rbとコマンドを実行します。入力した値はこんにちはですと結果が表示されることを確認しましょう。

https://tech-master.s3.amazonaws.com/uploads/curriculums//5db923041c755881b32e6f6e751428c8.gif

もし、想定通りの出力がされない場合は、以下の可能性があります。確認しましょう。

ディレクトリが間違っている（rubyディレクトリにいない）
コードの中に全角が混ざっている（文字列以外は半角で記述します）
コードに抜け漏れがある
式展開 #{ }が全角になっている（式展開は半角で記述します）
最初の章でRubyのプログラムを作成した際にも、「Hello World」を出力するためにputsメソッドを使用しました。
はじめてputsメソッドを見たときと比べると、変数や値の知識もつき、putsメソッドは、式の結果をターミナルに出力していたことがよくわかるはずです。

ターミナルから値を入力しよう
これまでputsを使ってターミナルに値を出力していました。
Rubyには出力だけでなく、ターミナルから入力する機能もあります。

getsゲッツメソッド
Rubyに用意された、ターミナルに値の入力機能を起動するメソッドです。
ターミナルで入力された値は文字列としてプログラムに渡されます。

getsをコードに記述すると、記述した行を読み込んだ段階で入力機能が起動し、
ターミナル画面は入力待ちの状態になります。

そこでキーボードから値を入力してエンターキーを押すと、getsメソッドは入力した文字をプログラムに返します。

【例】getsメソッド
1
2
3
4
# 入力機能が起動、入力された値が文字列として返る
name = gets

puts name
コードの読み込みは上から下へ順番に行われますが、
入力が終わるまで、コードの読み込みはgetsを記述した行で停止しています。

【例】getsメソッド
1
2
3
name = gets  # 入力が完了するまで、コードの読み込みは停止

puts name  # 入力が完了するまで、この行は読み込まれない。
input.rbを以下のように編集しましょう
getsメソッドを使用して、ターミナルから入力できるようにします。

ruby/input.rb
1
2
3
input = gets

puts "入力した値は#{input}です"
ターミナルでinput.rbを実行しましょう
ファイルを実行すると、入力待ちになるため適当な文字を打ちエンターキーを押しましょう。打ち込んだ文字が入力されたあと、「入力した値は〇〇」「です」とターミナル上に表示されます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//9aba03e8da6c7709900b78bb70ce1fd9.gif

文字列末尾の改行を取り除こう
先ほどgetsを用いて値を入力し、その値を用いる方法を学びました。
しかし、出力では勝手に改行されていることがわかります。これは、getsメソッドで入力された値は、末尾に改行がついた文字列になるためです。

この改行を取り除く方法を学びましょう。

chompチョンプメソッド
chompメソッドは、文字列が使用できるメソッドです。
chompメソッドを使用すると、文字列の末尾に存在する改行を取り除いた文字列を返してくれます。

input.rbを以下のように編集しましょう
chompメソッドで末尾の改行を取り除いてみましょう。

ruby/input.rb
1
2
3
input = gets.chomp

puts "入力した値は#{input}です"
ターミナルでinput.rbを実行しましょう
実行すると、改行されずに1行で出力されます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//0b755ccccd6d7378f479f034d4da4d54.gif

文字列を改行しよう
getsを使うと勝手に改行されますが、取り除けることはわかりました。
では逆に、putsで改行を加えたいときの改行方法を学びましょう。

バックスラッシュ記法
バックスラッシュ記法はその名前の通り、 \(バックスラッシュ) から始まる文字の記法のことです。日本語キーボードを使っている方はoption + ¥でバックスラッシュを打つことができます。

この記法を使うと文字列の中でただの文字ではなく改行や、タブなどを行うようになります。代表的なバックスラッシュ記法は以下に示します。

記法	意味
\n	改行
\t	タブ
\b	バックスペース
\\	バックスラッシュ
バックスラッシュ記法が適応されるのは文字を "(ダブルクォーテーション)で囲んだときのみ です。'(シングルクォーテーション)で囲ってしまうとバックスラッシュ記法は解釈されずにただの文字として出力されてしまいます。

input.rbを以下のように編集しましょう
バックスラッシュ記法を用いて改行してみましょう。

ruby/input.rb
1
2
3
4
5
6
7
8
9
input = gets.chomp

puts "入力した値は#{input}です"

# ダブルクォーテーションで囲いバックスラッシュ記法を使う
puts "改行したい改行したい\n改行した"

# シングルクォーテーションで囲うとバックスラッシュ記法は使えない
puts '改行したい改行したい\n改行できなかった'
ターミナルでinput.rbを実行しましょう
実行すると、ダブルクォーテーションで囲んだ文字列はちゃんとバックスラッシュ記法で書いた文字が適応されていることがわかります。

https://tech-master.s3.amazonaws.com/uploads/curriculums//bd28e12da4d07c959222f64b4ef34a7f.gif

シングルクォーテーションで囲んだ文字列の方はただの文字として出力されてしまっていることも分かりましたね。

