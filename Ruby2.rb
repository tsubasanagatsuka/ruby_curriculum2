2

# 目的
# irbの使用方法を理解すること
# 値が種類によって別物であることを理解すること
# メソッドの役割と使用方法を理解すること
# 文字列の生成方法と使用用途を理解すること
# 数値の生成方法と使用用途を理解すること
# 数値と演算子を用いた計算方法を理解すること
# 式展開を理解すること
# ターミナルを用いたプログラムの記述と実行
# ターミナルから簡単にRubyの記述と実行をしよう
# 本章では、プログラムを実行する際、「逐一ファイルに記述し、実行」という手順は踏まないこととします。代わりに、irbというコマンドで起動する簡易プログラム実行機能を利用します。

# irbアイアールビー
# irbコマンドは、ターミナルから直接Rubyのプログラムを動かすことができる機能を起動します。ちなみに、irbは「Interactive Ruby」の略です。

# 本章では、簡易的にRubyを実行する手順で学習します。前回はファイルを作ってからプログラムを実行していましたが、今回はirbコマンドという機能を使って、ファイル無しでプログラムを実行します。

# 【例】ターミナル

# # irbを起動
# % irb
# カリキュラムでは、irbコマンドで簡易的にプログラムを実行できる機能が起動している状態のことも、irbと呼ぶこととします。

# irbを終了するときは、exitと記述して実行します。

# 【例】irbの終了

# # irbを終了
# irb(main):001:0> exit

# # 問題なく終了すれば、プロンプトが表示される
# %
# 値を簡単に確認するときはirbを使います。

# Rubyにおける値
# 値に種類があることを学ぼう
# 数や文字をはじめ、プログラムで扱うデータを「値」と言います。

# プログラミングでは値の種類を明確に分けて扱います。
# 種類によってそれぞれ書き方が異なり、実行できる命令も異なります。


# この章からは、まず覚えておくべき値をそれぞれ紹介します。

# プログラムにおける文字の操作
# 文字を操作しよう
# 文字列
# 文字列は、プログラミングの中で文字を扱うための値です。

# 文字列を生成するには、文字をダブルクォーテーション"またはシングルクォーテーション'で囲みます。以下の例を見てください。

# 【例】Rubyファイル

"This is string"

'That is string too.'

# irbで以下のコードを実行しましょう
# irbでRubyの文字列を記述し、実行してみましょう。

# ターミナル

# # irbを起動
# % irb
# irb

# # 文字列を書いてエンターキーで実行
# irb(main):001:0> "Hello! こんにちは！"

# # 続けてこのように表示されれば成功
# => "Hello! こんにちは！"
# 全角スペースや日本語が含まれているとプログラムはエラーが生じますが、
# 文字列の値として扱う場合は、エラーにはなりません。

文字列を連結しよう
文字列同士は、お互いを連結できます。

文字列の連結
文字列を連結させるには、文字列同士を+(プラス)で繋ぎます。数式と同じような書き方です。

以下の例では、HelloとWorldの文字列が繋がっています。

【例】irb

# 文字列を連結
irb(main):001:0> "Hello " + "World"
=> Hello World
irbで以下のコードを実行しましょう
文字列を連結してみましょう。

irb

# 文字列を連結
irb(main):001:0> "Hey!" + " brother!"

# 続けてこのように表示されれば成功
=> "Hey! brother!"
文字の数を数えるメソッドを使おう
文字列の文字数を数える命令をプログラムしてみましょう。

プログラムにおける命令のことをメソッドと呼びます。

メソッド
メソッドとは、プログラミングにおける何らかの処理をまとめたものです。
メソッド名をプログラム中に記述することで、そのメソッドの処理を実行できます。

メソッド

Rubyには便利なメソッドがたくさん用意されています。
たとえば、ターミナルで文字入力モードを起動する、指定した文字をターミナルに出力する、などのメソッドです。また、特定の値にのみ使用できるメソッドもあります。

文字列にも、使用できるメソッドが用意されています。
ここでは、文字列の文字数を数えるメソッドを学びましょう。

lengthレングスメソッド
文字列が持つメソッドです。length（レングス）メソッドは文字列の文字数を数えてくれます。

メソッドの使用は、
以下のように値に対してメソッド名「length」をドット.で繋ぎ実行します。

【例】irb

# 文字列の文字数を出す
irb(main):001:0> "Hello World".length
=> 11
"Hello World".lengthは、1つの式として見ることもできますね。
上の例で=>の後に表示されているのは、「Hello World」の文字数「11」です。

irbで以下のコードを実行しましょう
lengthメソッドを試してみましょう。

irb

# lengthメソッドで文字数を出す
irb(main):001:0> "good morning".length

# 続けてこのように表示されれば成功
=> 12
プログラムにおける数字の操作
数字を操作しよう
文字ではなく数を扱うための値について学習しましょう。

数値
数値は、数を表現する値です。文字列とは異なり、計算などを行うことができます。

数値は文字列とは違って、ダブルクォーテーション"やシングルクォーテーション'も必要ありません。以下は数値を使った数の表し方の例です。

【例】Rubyファイル

# 整数
10

# 負の値
-10

# 小数
3.14
数をダブルクオーテーションで囲むと数値ではなく文字列として扱われてしまいます。
プログラミングでは文字列の"10"と数値の10は別物です。数値は計算ができますが、文字列は計算ができません。

irbで以下のコードを実行しましょう
irbでRubyの数値を記述し、実行してみましょう。

irb

# 数値を書いてエンターキーで実行
irb(main):001:0> 12345

# 続けてこのように表示されれば成功
=> 12345
数値で計算しよう
数値は文字列とは異なることを学びました。数値は計算できることが特徴です。

ここからは、メソッドと同じくプログラムでよく使われる演算子について学びましょう。

演算子
プログラミングにおける値の計算や比較などに使用する記号のことです。
計算における代表的な演算子は+や-、比較における代表的な演算子は>や<があります。

この簡単な記号である演算子を用いることで、計算や比較処理を瞬時に行ってくれます。

代数演算子
演算子の中でも計算を行うものは、代数演算子と呼ばれます。
Rubyで一般的な計算をする場合、以下の様な演算子が使えます。

代数演算子 説明
+ 足し算
- 引き算
* かけ算
/ 割り算
% 剰余(割ったあまり)
使い方は、普通の算数の計算と同じです。ただし、剰余の計算は馴染みがないので注意が必要です。例えば、「17を5で割ったときの余り」を求めることができます。以下の例を見てください。

【例】irb

# 足し算
irb(main):001:0> 1000 + 2000
=> 3000

# 引き算
irb(main):002:0> 3000 - 1500
=> 1500

# 掛け算
irb(main):003:0> 50 * 40
=> 2000

# 割り算
irb(main):004:0> 600 / 15
=> 40

# 剰余演算（5 ÷ 2をした余り）
irb(main):005:0> 5 % 2
=> 1
irbで以下のコードを実行しましょう
1年は何時間か計算してみましょう。

irb
1
irb(main):001:0> 24 * 365
実行すると、一瞬で計算結果が表示されたはずです。

異なる値同士の連結
たとえば、数値を計算した後に「計算結果はこちら」という文字列と計算結果を組み合わせて表示させたいときなど、数値と文字列を連結したくなることが出てきます。

異なる種類の値を連結したい場合に行う、値の変換方法を学びましょう。

値の種類を変えるメソッドを使おう
文字列"i am ",　数値20,　文字列" years old."
この3つの値を連結して出力してみましょう。

しかし、連結のために+を使って以下のように記述したとしても、エラーが生じてしまいます。

【例】irb

# 文字列と数値を連結させようとするとエラーが発生
irb(main):001:0> "i am " + 20 + " years old."
Traceback (most recent call last):
        5: from /Users/daihi/.rbenv/versions/2.7.0/bin/irb:23:in `<main>'
        4: from /Users/daihi/.rbenv/versions/2.7.0/bin/irb:23:in `load'
        3: from /Users/daihi/.rbenv/versions/2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        2: from (irb):1
        1: from (irb):1:in `+'
TypeError (no implicit conversion of Integer into String)
これは、文字列と数値は別の種類の値なので、連結することができないためです。
そこで、数値を文字列に変換するto_sメソッドを使って、数値の20を文字列の"20"に変換します。

to_sトゥーエスメソッド
数値が持つメソッドです。数値を文字列に変換してくれます。ちなみに、 to_sのsの意味は「string(文字列)」です。以下の例を見てください。

【例】irb

# 数値「20」にto_sメソッドをつけて実行
irb(main):001:0> 20.to_s
=> "20"
to_sメソッドによって、文字列"20"が実行結果になっています。

それでは、文字列と数値を連結させて、
"i am 20 years old."を表示しましょう。

irbで以下のコードを実行しましょう
to_sメソッドを試してみましょう。

ターミナル

# to_sで数値を文字列に変換し、連結
irb(main):001:0> "i am " + 20.to_s + " years old."

# 続けてこのように表示されれば成功
=> i am 20 years old.
「はじめから文字列"20"を用意すればよかったのでは？」と思うかもしれません。しかし、足し算した結果を文字列として利用したい場合など、数値を文字列に変換するto_sメソッドを利用する場面は多くあります。この方法は必ず覚えておきましょう。

反対に文字列を数値に変換するメソッドもあります。それがto_iメソッドです。これは文字列がもつメソッドです。

to_iトゥーアイメソッド
文字列が持つメソッドです。文字列を数値に変換してくれます。ちなみに、 to_iのiの意味は「integer(整数)」です。以下の例を見てください。

【例】irb

# 文字列「30」にto_iメソッドをつけて実行
irb(main):001:0> "30".to_i
=> 30
もし数字以外の文字列だった場合は、すべて数値0に変換されます。

irbで以下のコードを実行しましょう
to_iメソッドを試してみましょう。

irb

# to_iで文字列を数値に変換
irb(main):001:0> "100".to_i + 400
=> 500
文字列の中に文字列以外を含めてみよう
式
Rubyにおける「式」とは文字列や数値の他に、メソッドの呼び出し、次章以降に学習する変数や演算子式などが含まれます。
すなわち、"文字列", 1000, (1 + 5)などはすべて式です。

Rubyは記述をすべて式と捉えます。

これまで、irbでとくにメソッドも使用せず、文字列や数値の値を確認できていました。
これは、式の結果が表示されていたのです。

【例】irb

irb(main):001:0> "記述はすべて式"

# 式の結果
=> "記述はすべて式"
Rubyは式の答えを元に計算や出力を行います。

これまでの文字列の連結には今は+(プラス)を使っていました。
実は、文字同士の連結はRubyの式展開を使えばより綺麗に書けます。

式展開
式展開は、文字列の中に式を入れることができる機能です。

式展開の書き方は文字列中で#{式}とするだけです。

式展開をする場合は、文字列を作るときにダブルクォーテーション"で囲む必要があります。
シングルクォーテーション'で囲んだ場合は式展開が行われません。

irbで以下のコードを実行しましょう
式展開を試してみましょう。

irb

# 式展開で文字列に式を含む
irb(main):001:0> "今日で#{20}歳になりました"
=> "今日で20歳になりました"

# シングルクォーテーションだと式展開されない
irb(main):002:0> '今日で#{20}歳になりました'
=> "今日で\#{20}歳になりました"

【練習問題 Ruby】文字列と数値を使おう①
問題.1
以下のプログラムを実行するとエラーが起きます。
①エラーが起きた原因
②正しいソースコード
をそれぞれ答えてください。

実行したプログラム
1
puts "1日は" + 24 * 60 + "分です。"

A.
puts "1日は + #{24 * 60} + 分です。"

模範解答
解答
①エラーが起きた原因
24 * 60の箇所は数値であり、+を使って文字列と連結させることはできないため。

②正しいソースコード
1
puts "1日は#{24 * 60}分です。"
もしくは

1
puts "1日は" + (24 * 60).to_s + "分です。"
解説
文字列と数値はそのままでは連結できません。文字列として連結したい場合は、数値を文字列に変換する必要があります。

数値を文字列に連結する方法は大きく2つです。

式展開を使って文字列の中に数値を埋め込む
to_sメソッドを使って数値を文字列に変換する
式展開の場合は、必ず文字列をダブルクオーテーション(")で囲みましょう。そして埋め込みたい値を#{}で囲んで、文字列の中に入れます。

to_sメソッドの場合は、数値の部分を数値.to_sとして、あとは問題文のプログラムと同様に+で繋ぎます。今回は数値が計算式になっているため、計算式をカッコで囲み、カッコの終わりに.to_sを繋げます。つまり(計算式).to_sのようになります。


