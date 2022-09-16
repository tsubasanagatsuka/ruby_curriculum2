# value = gets.to_i

# if value > 0
#   puts "値は正です"
# elsif value < 0
#   puts "値は負です"
# else
#   puts "値は0です"
# end

ride_count = 0
friends = []

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
if friend[:height] >= 130
  puts "#{friend[:name]}くんは乗車できます"
  ride_count += 1
else
  puts "#{friend[:name]}くんは乗車できません！"
end

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
if friend[:height] >= 130
  puts "#{friend[:name]}くんは乗車できます"
  ride_count += 1
else
  puts "#{friend[:name]}くんは乗車できません！"
end

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
if friend[:height] >= 130
  puts "#{friend[:name]}くんは乗車できます"
  ride_count += 1
else
  puts "#{friend[:name]}くんは乗車できません！"
end

puts "乗車するのは#{ride_count}人です"


概要
この章では、条件によってどの処理を動かすか決める条件分岐処理を学びます。
プログラムを論理的に実装する方法を学びましょう。

目的
条件分岐処理の実装方法と使用用途を理解すること
比較演算子の使用方法を理解すること
論理演算子の使用方法を理解すること
真偽値を理解すること
事前準備
サンプルコード用のRubyファイルを作成しよう
学習に使用するRubyファイルを作成します。

新規Rubyファイルを作成しましょう
以下のように、rubyディレクトリに「if.rb」というファイルを作成してください。

 ホームディレクトリ
 ruby
 if.rb
条件分岐処理
演算子で比較しよう
これまで学習した演算子は、数値を計算する代数演算子、変数に値を代入する代入演算子、配列に要素を追加する配列演算子がありました。

roller_coaster.rbでは、身長が一定の高さを超えているか比較する必要があります。
このような場合に必要となる、値を比較する演算子を学びましょう。

比較演算子(>, >=, <, <=, ==)
比較演算子は、値同士を比較したいときに使用します。
書き方はシンプルで、値と値の間に演算子を記述するだけです。

比較演算子	使い方	説明
>	A > B	AはBより大きいか
>=	A >= B	AはB以上か
<	A < B	AはBより小さいか
<=	A <= B	AはB以下か
==	A == B	AとBは等しいか
比較演算子を使った場合、その条件が正しいかどうかによって、
trueもしくはfalseと呼ばれる値になります。

true/falseトゥルー/フォルス
trueとfalseは、式が真か偽かを扱う真偽値という値です。真であればtrue、偽であればfalseで表されます。

比較演算子を用いた式を実行すると、以下のような結果になります。

【例】irb
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
20
21
22
23
# 1は20より小さいか？
irb(main):001:0> 1 < 20
=> true

# 5は5以下か？
irb(main):002:0> 5 <= 5
=> true

# 1は20より大きいか？
irb(main):003:0> 1 > 20
=> false

# 5は5以上か？
irb(main):004:0> 5 >= 5
=> true

# 2 × 5は10と等しいか？
irb(main):005:0> 2 * 5 == 10
=> true

# 10は20と等しいか？
irb(main):006:0> 10 == 20
=> false
比較演算子を使った場合は、式が正しければtrue、間違っていればfalseという結果になります。文字列の"true"や"false"とは別の意味であり、真偽値を表していることは理解しておきましょう。

irbで以下のコードを実行しましょう
irbコマンドを実行して、タワーの高さを比べてみましょう。

irb
1
2
3
4
5
# 東京タワーの高さはスカイツリー以下か？
irb(main):001:0> 333 <= 634

# 東京タワーの高さはスカイツリー以上か？
irb(main):002:0> 333 >= 634
式が正しいかどうかで、trueやfalseの真偽値が返ってくることがわかります。

https://tech-master.s3.amazonaws.com/uploads/curriculums//29f26d3c043752786ecddd1bee57ee3b.png

論理演算子(!)
式の真偽の確認や、真偽値に対しての演算を行うことができる演算子を論理演算子と呼びます。

!(エクスクラメーションマーク)は not演算子 と呼ばれ、否定の意味で使われます。
!と=を合わせた!=は、==と反対の意味で 値同士が等しくない 場合にtrueを返します。

【例】irb
1
2
3
4
5
6
# 2 × 3 は6ではないか？
irb(main):001:0> 2 * 3 != 6
=> false
# 2 × 3 は10ではないか？
irb(main):002:0> 2 * 3 != 10
=> true
それでは、論理演算子を使ってみましょう。

irbで以下のコードを実行しましょう
値が異なるか確認してみましょう。

irb
1
2
3
4
5
# 数値の777と文字列の"777"は異なるか？
irb(main):001:0> 777 != "777"

# 文字列"海"と"海"は異なるか？
irb(main):002:0> "海" != "海"
「等しくない」場合は、trueが返ってくることがわかります。

https://tech-master.s3.amazonaws.com/uploads/curriculums//d654a3f6f4087283659e486fb498a79b.png

条件によって処理を分けよう
roller_coaster.rbは、身長の高さでジェットコースターに乗れるか判別します。

「もし身長が〇〇以上だったら」という条件を満たすかどうかで判別し、処理を分ける必要があります。

世の中にはこのような、「もし〇〇だったら△△をする」という条件がたくさんあります。
例えば、正解かどうか判別する正誤判定、点数によって通過するか判別する合格判定など、ほとんどのアプリにはこうした条件を用いた処理があります。

Rubyには、条件によって処理を分ける条件分岐処理という仕組みが用意されています。

条件分岐処理
条件分岐処理とは、条件を満たしているかどうかで実行内容を分岐する処理です。単に条件分岐とも呼ばれます。
この仕組みで、「もし〇〇だったら△△をする」と処理を分けることができます。

条件分岐処理において、分岐の条件として記述する式を条件式と呼び、
条件式には、真偽値になる式を記述します。

ifイフ文
Rubyの条件分岐にはif(イフ)文という文法を使います。
if文は、条件式が正しいか正しくないか、つまりtrueかfalseかで実行する処理を分岐させることができます。

基本的なif文の書き方は以下です。
条件式がtrueになる場合のみ、if 条件式~endの間に記述した処理を実行します。

【例】if文
1
2
3
if 条件式
  処理
end
複数行で記述した場合、endまでの記述はすべて処理になります。
このとき、処理の記述の前には空白を置いて揃えるのが一般的です。
空白によって記述位置をずらすことで、if文の中の記述であることをわかりやすくするためです。

こうした、何かの中に別のものが入っている構造のことを入れ子構造と言います。
入れ子構造を表現するための空白のことを字下げまたはインデントと呼びます。

インデントを入れて読みやすくしておくことはとても大切です。
コードが増えたときに混乱しないよう、必ずインデントは入れましょう。

条件分岐を書いてみよう
実際にif文を書いてみましょう。

if.rbを編集しましょう
if文で条件分岐を作ってみましょう。

ruby/if.rb
1
2
3
4
5
value = 3

if value > 0
  puts "値は正です"
end
このif文の条件式はvalue > 0で、valueは3なので、条件式は真(true)となります。よってif 条件式~endの間の処理が実行され、画面に"値は正です"と表示されます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//ce65eae2cc53774f4d9beb07b428a1b5.png

続いて、条件式が偽(false)だったときの処理を実行する方法を学びましょう。

elseエルス(if文)
if文で条件式が偽のときに処理を行うには、elseを使います。
条件を満たさなかったときの処理をelse~endの間に記述します。

【例】elseによる条件式が偽の処理
1
2
3
4
5
if 条件式
  # 条件式が真(true)のときに実行する処理
else
  # 条件式が偽(false)のときに実行する処理
end
else~endの間には、条件式がfalseのときに実行する処理を書きます。
これを使い先ほどのプログラムで、値が負のときには"値は負です"と表示させるようにしましょう。

if.rbを編集しましょう
elseを使って、valueが負の値だったときの処理を追加しましょう。

ruby/if.rb
1
2
3
4
5
6
7
value = 3

if value > 0
  puts "値は正です"
else
  puts "値は負です"
end
value > 0という条件式を満たせば正の値、満たしていない場合は負の値になります。
elseを使えば、条件を満たしていないときの処理、つまり負の値であるときの条件分岐が作れます。

複雑な条件分岐を書いてみよう
数学に詳しい方ならお気づきかもしれませんが、先ほどのプログラムは数学的には間違っています。'0'は正と負のどちらでもないためです。今のプログラムでは、valueを0にしても"値は負です"と表示されてしまいます。

このように、条件を満たさなかったなかでも、特定の条件によってはさらに処理を分けたいときがあります。

条件分岐を以下のように3つのパターンで考えます。

条件	表示
value > 0	値は正です
value < 0	値は負です
それ以外	値は0です
このような複数の条件分岐を書くときはelsifという文法を使います。

elsifエルスイフ(if文)
elsifは、elseのように条件式がfalseだったときの処理を記述するものですが、
条件を満たさなかった場合に対して、ifのように条件式を追加できます。

【elsifによる複数の条件分岐】
1
2
3
4
5
6
7
8
if 条件式1
  # 条件式1が真(true)のときに実行する処理
elsif 条件式2
  # 条件式1が偽(false)のとき、かつ
  # 条件式2が真(true)のときに実行する処理
else
  # 条件式1と条件式2がどちらとも偽(false)のときに実行する処理
end
すなわち正か負か0かの条件分岐は以下のようになります。

条件分岐

これをソースコードに書き直しましょう。
ユーザから入力された値が'正'、'負'、'0'のどれなのかを判断するようにします。

if.rbを編集しましょう
valueの値を入力できるようにした上で、値が負のときの条件を書き換えます。
値が0のときの処理も記述しましょう。

ruby/if.rb
1
2
3
4
5
6
7
8
9
value = gets.to_i

if value > 0
  puts "値は正です"
elsif value < 0
  puts "値は負です"
else
  puts "値は0です"
end
何度か実行して自由に数字を入力してみてください。値によって処理が分岐することを確認できます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//2f3ca8298a5fb92b6391c97a27ada217.png

ミニアプリ作成
本章で学んだ内容を使って、roller_coaster.rbの開発を進めましょう。

情報によって表示を変えよう
roller_coaster.rbは、身長によってジェットコースターに乗れるかどうかを判別する条件分岐があります。

現在のroller_coaster.rbには、そのような条件分岐がありません。

【例】現在のroller_coaster.rb
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
20
21
22
23
24
25
26
27
28
ride_count = 0
friends = []

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
ride_count += 1

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
ride_count += 1

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
ride_count += 1

puts "乗車するのは#{ride_count}人です"
if文を使って条件分岐処理を作りましょう。

roller_coaster.rbを編集しましょう
ifで身長が130cm以上かどうか判別する条件分岐処理を作り、出力を切り替えます。

ruby/roller_coaster.rb
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
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
ride_count = 0
friends = []

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
if friend[:height] >= 130
  puts "#{friend[:name]}くんは乗車できます"
  ride_count += 1
else
  puts "#{friend[:name]}くんは乗車できません！"
end

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
if friend[:height] >= 130
  puts "#{friend[:name]}くんは乗車できます"
  ride_count += 1
else
  puts "#{friend[:name]}くんは乗車できません！"
end

friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
if friend[:height] >= 130
  puts "#{friend[:name]}くんは乗車できます"
  ride_count += 1
else
  puts "#{friend[:name]}くんは乗車できません！"
end

puts "乗車するのは#{ride_count}人です"
if friend[:height] >= 130で、身長が130cm以上かを確認しています。
この条件を満たせばジェットコースターに乗ることができるため、「〇〇くんは乗車できます」と出力して、乗車人数のride_countを1増やします。

ターミナルでroller_coaster.rbを実行しましょう
ターミナルで実行して、正しく条件分岐されるか確かめましょう。最後に、130cm以上の人数が出力されれば成功です。
https://tech-master.s3.amazonaws.com/uploads/curriculums//a09b21fd4d80ecbf1d8e1c7fa039f1b7.png

これで、求めるアプリケーションの動作は完成しました。
しかし、すでに感じている方も居るかもしれませんが、4行目以降は12行にも渡るまったく同じ記述が3回も続き冗長です。

【例】同じ記述が繰り返され冗長な部分
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
friend = {}
puts "お友達の名前は？"
friend[:name] = gets.chomp
puts "お友達の身長は？"
friend[:height] = gets.to_i
friends << friend
if friend[:height] >= 130
  puts "#{friend[:name]}くんは乗車できます"
  ride_count += 1
else
  puts "#{friend[:name]}くんは乗車できません！"
end
次章では、この繰り返し記述している部分を1つにまとめて省略する方法を学びます。

練習問題
本章で学んだことを問題を解きながら復習しましょう。問題を解く際は、カリキュラムを見てはいけません。思い出すという行動をすることで、より一層の知識定着が可能となります。

不明点は次のカリキュラムに進む前に復習し、満点をとれるまで解き直しましょう。それまで次のカリキュラムに進まないようにしてください。以降のカリキュラムは、これまで学んだ内容が身についている前提で進むからです。

【練習問題 Ruby】条件分岐処理をしよう①

この章の振り返り
要点チェック
 比較演算子とは、値同士の比較ができる演算子のこと。
 真偽値とは、true/falseのように真か偽かを扱う値のこと。
 論理演算子(!)とは、真偽値に対しての演算を行うことができる演算子のこと。
 if文とは条件分岐処理に属し、「正しい場合」と「正しくない場合」で処理を分岐させることができる文法のこと。
このカリキュラムの理解度を教えてください
ボタンを押していただくと次へ進めます
<< 前のカリキュラム
次のカリキュラム >>
お疲れさまです！
Ruby（基礎文法）はここまでです。
