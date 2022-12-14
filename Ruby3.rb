概要
この章では、変数というものの扱い方を学びます。
効率的にコードを書くための、プログラミングで大切な考え方を学びましょう。

目的
変数の役割と定義方法を理解すること
命名規則を理解すること
プログラミングにおける再利用の考え方を理解すること
変数
同じ値を何度も使おう
これまで値を使うたびに、同じ値であっても毎回記述していました。

しかし、毎回同じ値を書くのはめんどうですね。
たとえば円の面積の計算を行うプログラムを作成する場合、毎回円周率の値を書くのは非常に大変な作業です。

【例】同じ値を毎回記述する

# 半径3の円の面積
3 * 3 * 3.14159

# 半径10の円の面積
10 * 10 * 3.14159

# 半径11の円の面積
11 * 11 * 3.14159
もし円周率を3.14159ではなく3.14へ変更することになったら、記述をすべて書き換える必要があります。

この問題を解決するのが変数という仕組みです。

変数
変数とは、値を入れる箱のようなものです。この箱には名前をつけることができ、どんな値が入っているのかを簡単に識別できるようになります。この名前を変数名と言います。

変数を利用することで、値を再利用したい場合に、変数の名前を使うだけで呼び出すことができます。

変数の使い方について、順に説明します。

変数の宣言と定義
変数を作ることを変数の宣言と言います。このとき、作成する変数には名前をつけます。
そして宣言した変数にどのような値を入れるのか記述することを変数の定義と言います。

変数の宣言と定義

基本的に宣言と定義は同時に行うため、お互いが同じ意味として捉えられることが多く、違いを意識することはあまりありませんが、用語として覚えておきましょう。

変数は以下のように定義します。=を挟んで右側においた値を、左側の変数の中に入れるイメージです。

【例】Rubyファイル
1
変数名 = 格納する値
以下は変数の使用例です。

【例】irb

# piという変数の中身を、円周率の3.14159であると定義する
irb(main):001:0> pi = 3.14159
=> 3.14159

# piを呼び出すと、格納された3.14159が返ってくる
irb(main):002:0> pi
=> 3.14159

# 何度実行しても、格納された3.14159が返ってくる
irb(main):003:0> pi
=> 3.14159
変数の定義には、=を使って代入と呼ばれる記述がされています。

代入
変数のあとの=(イコール)は数学の方程式のように等しいという意味ではなく、
「変数の箱の中に値を入れる」という意味です。これを代入と言います。

この=は代入演算子と呼ばれます。
ここで必ず覚えておくべき重要なポイントですが、

「Rubyにおいて=が1つの式は必ず『右側の値を左の変数に代入する』という意味」

であることです。

変数の代入

もう一度、先ほどの式を見てみましょう。

【例】irb

# piという変数の中身を、円周率の3.14159であると定義する
irb(main):001:0> pi = 3.14159
=> 3.14159

# piを呼び出すと、格納された3.14159が返ってくる
irb(main):002:0> pi
=> 3.14159

# 何度実行しても、格納された3.14159が返ってくる
irb(main):003:0> pi
=> 3.14159
上の例で行っている処理は、「piという変数に円周率をあらわす数値3.14159を代入する」ということになります。
すると変数piの中身は、数値の3.14159となります。

そのため、数値を返す「pi」に対しては、to_iメソッドや演算子による計算など、
数値の行える動作すべてが、同じように行えます。

再代入
1度値を代入したあとの変数に、別の値を再び代入することもできます。
つまり、変数の値は別の値に変更できます。

プログラム中に何度でも変更可能であることも変数の特徴です。

以下の例を見てください。

【例】irb

# 変数に代入
irb(main):001:0> value = "Hello World"
=> "Hello World"

# 変数を出力
irb(main):002:0> value
=> "Hello World"

# 変数に再代入
irb(main):003:0> value = "See you"
=> "See you"

# 変数を出力
irb(main):004:0> value
=> "See you"
変数の値が後から代入したものに書き換わっていることがわかります。
Rubyでは、変数にはどんな値でも代入できます。もちろん、変数に対してメソッドを使うこともできます。

代入を利用して、以下のように記述すれば、変数自身の値を利用した計算結果と入れ替えることができます。

【例】irb

# 変数に代入
irb(main):001:0> number = 7
=> 7

# 変数に1を足す
irb(main):002:0> number = number + 1
=> 8
また、このような変数自身を利用して代入する場合には、自己代入演算子を用いて記述することもできます。

自己代入演算子（+=, -=, *=, /=）
自己代入とは、その名の通り自分自身に代入するということです。自己代入演算子は、通常の演算子を用いた書き方を省略して記述できます。

例としてnumber = number + 1を自己代入演算子+=を使った書き方に直してみましょう。

【例】通常の代入演算子
1
number = number + 1
この式を自己代入演算子+=を使えば以下のように書き直せます。
これらは同じ意味になります。

【例】自己代入演算子
1
number += 1
上記ソースコードを比較するとわかるように自己代入演算子を使った式number += 1は、変数numberに1を足した値をnumber自身に代入するという処理になります。

以下に代表的な自己代入演算子を示します。

自己代入演算子	例	処理
+=	number += 1	numberに1足した値をnumber自身に代入
-=	number -= 2	numberから2引いた値をnumber自身に代入
*=	number *= 3	numberに3かけた値をnumber自身に代入
/=	number /= 4	numberを4で割った値をnumber自身に代入
このように自己代入演算子を使うと、変数自身にある値を足したり、引いたりすることを簡単に記述できます。
コードを省略できるためよく使われます。どちらの記述も覚えておきましょう。

変数の命名規則
変数には名前をつけることができます。名前は自由に決められますが、一定のルールがあり、それを守らなくてはいけません。

命名規則	説明
変数の中身が何かわかる	どんな名前もつけられますが、aaaのような意味のない名前は避けましょう。
小文字で始める	大文字からも開始できますが、とくに理由がない場合は避けましょう。
_(アンダーバー)で始めない	_からも開始できますが、とくに理由がない場合は避けましょう。
2文字目以降には使えます。
数字で始めない	1文字目に使うとエラーが生じます。
2文字目以降には使えます。
日本語を使わない	文字列以外では日本語は使えないため、変数名も日本語は使えません。
スペースを含めない	名前にスペースが入るとエラーが生じます。
予約語を使用しない	Rubyには文法などで使うことがあらかじめ決まっている単語があり、
それを予約語と呼びます。これらを使うとエラーが生じます。
【例】Rubyファイル

# 良い例
number = 100
dog = "ワンワン"
message_1000_AM = "午前10時ちょうどをお知らせします。"

# 悪い例
bad number = 777  # スペースが入っているので×
do = "ワンワン"  # doは予約語として存在しているので×
1000_AM_message = "午前10時ちょうどをお知らせします"  # 数字から始まっているので×
この規則は今後ずっと用いるのでここで覚えてしまうと良いでしょう。

ここで改めて、「なぜ変数を使うのか」を考えてみましょう。大きく2点の理由があります。

値の意味がわかりやすくなる
値を再利用しやすくなる
1つ目に、値の意味がわかりやすくなるためです。変数が値に名札をつけるような役割となり、ソースコード内で値の意味がわかりやすくなります。

以下はある映画のタイトルと説明文を画面上に出力するプログラムです。

【例】irb

irb(main):001:0> title = "Spider man"
=> "Spider man"

irb(main):002:0> description = "It is amazing"
=> "It is amazing"

irb(main):003:0> puts title
Spider man
=> nil

irb(main):004:0> puts description
It is amazing
=> nil
ただ"Spider man"と出力しただけではこれが何の文字列かわかりませんが、titleという変数に入れることで、この文字列はタイトルであることがすぐにわかるようになりました。

こうしたソースコードの見やすさ(可読性)や分かりやすさは、プログラミングにおいて非常に重要です。

2つ目に、変数を使うことで、値の再利用が簡単になるためです。
もしプログラムの中で同じ値を何度も使う場合、その値を変数にして使うようにすれば、あとからその値を変える必要が生じた場合も変数に代入する箇所を変更するだけで済みます。

以下の例を見てください。直径が10の円の、面積と円周を計算して変数に代入しています。

【例】irb

# 直径10の場合
irb(main):001:0> menseki = (10 / 2) * (10 / 2) * 3.14  # 面積
=> 78.5

irb(main):002:0> ensyu = 10 * 3.14  # 円周
=> 31.400000000000002
このソースコード上では直径を示す「10」が3回も出ています。もし直径を20に変更する場合、10と書いてある箇所をすべて20に訂正するのは大変ですし、訂正し忘れる可能性もあります。

また、ただ「10」とだけ書かれても何の値かわかりづらいので、上のソースコードを以下のように変更します。

【例】irb

# 直径10
irb(main):001:0> tyokkei = 10
=> 10

# 面積
irb(main):002:0> menseki = (tyokkei / 2) * (tyokkei / 2) * 3.14
=> 78.5

# 円周
irb(main):003:0> ensyu = tyokkei * 3.14
=> 31.400000000000002
これなら直径を20に変える場合も、以下のように変数の値を変更すれば良いでしょう。

【例】irb

# 直径を20に変更
irb(main):001:0> tyokkei = 20
=> 20

# 面積
irb(main):002:0> menseki = (tyokkei / 2) * (tyokkei / 2) * 3.14
=> 314.0

# 円周
irb(main):003:0> ensyu = tyokkei * 3.14
=> 62.800000000000004
可読性も柔軟性も一気に向上しました。
このように、できるだけ変数を使ってわかりやすいコードを書くよう心がけましょう。

irbで以下のコードを実行しましょう
変数を使ってみましょう。

irb

# 変数に値を代入
irb(main):001:0> name = "takashi"
=> "takashi"

# 文字数を調べる
irb(main):002:0> name.length
=> 7

# 変数を出力
irb(main):003:0> name
=> "takashi"
変数を使うことで、文字列の意味もわかりやすくなりました。
さらに、値を再利用することも簡単になりました