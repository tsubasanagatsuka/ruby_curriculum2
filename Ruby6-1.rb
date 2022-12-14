
問題.1
以下のプログラムを書いてください。

1行目：以下の要素を持ったハッシュをuserという変数に入れて定義する



回答
1
解答を貼り付けてください。
1
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
解答
以下の2つのどちらでも正解。

キーの指定にシンボルを使った場合
1
user = { name: "山田", age: 20 }
キーの指定に文字列を使った場合
1
user = { "name" => "山田", "age" => 20 }
解説
ハッシュの生成には波括弧{}を使います。
※配列は角括弧[]なので間違えないように注意しましょう。

波括弧の中に値を入れていきますが、ハッシュはキーと値をセットで1つの要素とみなします。よってハッシュは{ キー1と値1, キー2と値2, キー3と値3,...}と記述していきます。

キーの記述方法は2つです。1つがシンボル、もう一つが文字列です。

シンボルを使ったキーの記述方法
シンボルの場合は、キーの名前のうしろにコロン:をつけて定義します。

1
{ キーの名前: 値}
文字列を使ったキーの記述方法
文字列の場合は、文字列のあとに矢印=>をつけて定義します。
※文字列と矢印の間には半角スペースを入れることが一般的です。

1
{ "キーの名前" => 値}
採点方法
波括弧でハッシュを定義できていれば1点
キーと値の書き方が正しければ3点
この回答の点数を入力してください。
0
点配点4点
問題.2
以下のプログラムを書いてください。

1行目：以下の要素を持ったハッシュをuserという変数に入れて定義する



2行目：userのageを22に変更する
3行目：userに新しく以下の情報を追加する



回答
1
解答を貼り付けてください。
1
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
解答
以下の2つのどちらでも正解。

キーの指定にシンボルを使った場合
1
2
3
user = { name: "山田", age: 20 }
user[:age] = 22
user[:gender] = "男性"
キーの指定に文字列を使った場合
1
2
3
user = { "name" => "山田", "age" => 20 }
user["age"] = 22
user["gender"] = "男性"
解説
ハッシュの値の変更
ハッシュは定義したあとに値を変えることができます。配列が順番を指定して、値を変えられたように、ハッシュではキーを指定して値を変えます。

1
ハッシュ[変えたい値のキー] = 変更したい値
キーの指定方法はシンボルか文字列です。また、ハッシュは定義のときは波括弧{}ですが、値を取り出すときには各括弧[]になるので注意してください。

ハッシュの値の追加
ハッシュは定義したあとに値を追加することができます。値を追加するときも、記述方法は値の変更と同じです。

1
ハッシュ[追加したい値のキー] = 追加したい値
採点方法
角括弧でキーを指定できていれば1点
問題文の要求通りに動くコードになっていれば5点
この回答の点数を入力してください。
0
