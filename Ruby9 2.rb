def mixer(fruit)
  puts "#{fruit}を細かく砕く"
  return "#{fruit}ジュース"
end

puts "フルーツ"

input = gets.chomp

mixer(input)



概要
この章では、複数行に渡る処理をまとめるためのメソッドを定義する方法を学びます。
処理をまとめておき、再利用する方法を学びましょう。

目的
メソッドの定義方法を理解すること
スコープの仕組みを理解すること
引数の仕組みを理解すること
戻り値の仕組みを理解すること
事前準備
サンプルコード用のRubyファイルを作成しよう
学習に使用するRubyファイルを作成します。

 新規Rubyファイルを作成しましょう
以下のように、rubyディレクトリに「method.rb」というファイルを作成してください。

 ホームディレクトリ
 ruby
 method.rb
メソッド
まずは、以下の動画を視聴し、メソッドの概要を掴みましょう。



処理に名前をつけたものを作ろう
ここまでの学習で、はじめと比べると処理を増やせるようになってきました。

処理が増えてくると、どこからどこまでが関係している処理なのかがわからなくなってきて、コードが読みづらくなってきます。

処理の内容は1つにまとめてしまったほうが、読みやすくなる上、再利用できるため毎回大量のコードを書く必要がなくなります。ここで、処理をメソッドとしてまとめましょう。

これまでもメソッドは使用してきましたが、これらはRubyにもともと用意されているため使用できていました。実は、メソッドは自分で作ることができます。

 メソッドの定義
puts, to_s, to_iなど、メソッドは今までにもたくさん出てきました。
メソッドはあらかじめ用意されたものだけでなく、自分で定義することもできます。

メソッドを定義するには、以下のように書きます。

【例】メソッドの定義
1
2
3
def メソッド名
  # 実行する処理
end
defの横に書いた文字が、メソッド名となります。こちらは好きな名前にできますが、小文字の英語から始まり、単語を繋ぐ場合は_で繋ぎます。また、数字から始めてはいけません。

メソッドとは、決まった処理のまとまりです。定義ができたら、プログラム中でメソッド名を書くだけで、メソッドのdef メソッド名からendの間に書かれた処理が実行されます。

【例】メソッドの定義と実行
1
2
3
4
5
6
7
# メソッドの定義
def say_hello
  puts "Hello World"
end

# メソッドの実行
say_hello
上記のコードで注意しなければならないのは、「メソッドの定義部分はそのメソッドが実行されるまで読まれない」ということです。今回は2~4行目までメソッドの定義部分なので、始めは読み飛ばされます。7行目でsay_helloを呼び出しているので、ここではじめて定義部分を読み、3行目のputs "Hello World"が実行されることになります。

以下の図で、コードが読まれる順番を確認しましょう。

コードが読まれる順番

最終的な値を理解しよう
メソッドを定義できるようになりました。ここで、大切な概念を1つ学びます。

Rubyのメソッドを実行すると、呼び出したところの値が置き換わります。
たとえば、文字列にlengthメソッドを使った場合、メソッドを使った式の値は数値になります。

【例】メソッドの呼び出しもとの値
1
2
3
# 文字列の「Apple」ではなく数値の「5」が表示される
irb(main):001:0> "Apple".length
=> 5
これは、メソッドが呼び出しもとに値を返す、戻り値という仕組みによるものです。

 戻り値
戻り値（もどりち）は、メソッドから呼び出した場所に渡される値のことです。
つまり、メソッドが処理された後の最終的な値のことです。返り値とも呼びます。

会話で伝える際には、「このメソッドの戻り値は〇〇になる」や「戻り値には〇〇が返ってくる」などと表現します。

これまで、irbで=>に続いて表示されていた値は、戻り値を表しています。

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
# 文字列だけだと、そのままその値が戻り値になる
irb(main):001:0> "Hello World"
=> "Hello World"

# 文字列にlengthメソッドを使うと、数値が戻り値になる
irb(main):002:0> "Hello World".length
=> 11

# 数値にto_sメソッドを使うと、文字列が戻り値になる
irb(main):003:0> 365.to_s
=> "365"
このように、Rubyの値自体、またはメソッドを利用した式には、すべて戻り値があります。

定義されたメソッドは、処理の最後の行の結果が戻り値となります。

【例】
1
2
3
4
5
6
7
def sample
  "1"
  "2"
  "3"         # 最後の行が戻り値になる
end

puts sample   # => 3
https://tech-master.s3.amazonaws.com/uploads/curriculums//bbff951b9ffa21155014f8a97a779d4b.png

もし途中の行の結果を戻り値としたい場合や、戻り値であることを明示したい場合は、return文を記述します。

 returnリターン文
メソッド内でreturn ◯◯と記述すると、returnの後ろに続けた式がそのメソッドの戻り値になります。returnを利用した時点で戻り値が決まり、メソッドはその行の処理を終えると強制的に終了します。

以下の例を見てみましょう。

【例】returnを利用した場合
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
def sample
  "1"
  "2"
  "3"

  return "4"  # ここで処理は終わり

  "5"         # 呼ばれない
  "6"         # 呼ばれない
end

puts sample   # => 4
処理が途中で終了し、returnを記述した行の値が戻ってきていることがわかります。

また、Rubyではreturn文を省略できます。
return文を省略した場合、メソッドの戻り値はそのメソッドの中で最後に実行された式の値となります。

【例】returnを省略した場合
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
def sample
  "1"
  "2"
  "3"
  "4"
  "5"
  "6"         # 最後に実行されている
end

puts sample   # => 6
上記のように文字列を書いておくだけの場合、戻り値はその文字列の値となります。
カリキュラムではreturn文を省略する場合が多くなります。メソッド内のどの値が戻り値になるか、読み解けるようになっておきましょう。

メソッドを定義してみよう
実際に、メソッドの定義と実行を体験してみましょう。
処理をメソッドとして定義します。

 method.rbを編集しましょう
まず、method.rbに以下のコードを書きます。

ruby/method.rb
1
2
3
4
5
6
def say_hello
  puts "Hello World"
end

# メソッドの実行
say_hello
続いてターミナルからmethod.rbを実行します。

ターミナル
1
2
3
4
5
6
7
8
# rubyディレクトリに移動
% cd ~/ruby

# method.rbを実行
% ruby method.rb

# 以下のように表示されれば成功
Hello World
メソッドを定義したことで、say_helloと記述するだけで処理を実行できるようになっていることがわかります。

値が使える範囲を理解しよう
メソッドを定義できるようになりました。定義したメソッドの処理をより便利なものにしましょう。

今回は、メソッドの外に定義されている変数を使った処理を考えてみます。
以下のコードは、入力された値を変数numberに数値として代入し、メソッドでその変数に1を足す処理を想定しています。

【例】メソッドの外にある値
1
2
3
4
5
6
7
number = gets.to_i

def plus_one
  puts number + 1
end

plus_one
しかし、このコードは実行すると以下のエラーが生じてしまいます。

【例】ターミナル
1
2
3
Traceback (most recent call last):
    1: from test.rb:7:in `<main>'
test.rb:4:in `plus_one': undefined local variable or method `number' for main:Object (NameError)
このエラーは、「plus_oneメソッドではnumberという変数は定義されていない」と指摘されているものです。すでにメソッドの外で変数は定義しているはずですが、なぜエラーが生じたのでしょうか。

実は、メソッドの外に定義されている変数をメソッドの中で使うことはできません。

ここで、変数の使える範囲をあらわすスコープという概念を学びましょう。

 スコープ
スコープは、定義した変数が使える範囲のことです。

変数には、使える範囲があらかじめ決まっています。
メソッドの外に定義されている変数は、メソッドの中では使えません。
その逆に、メソッドの中で定義された変数は、メソッドの外では使えません。

https://tech-master.s3.amazonaws.com/uploads/curriculums//1a3887f0eabfce47c37b5a034ba415cf.png
https://tech-master.s3.amazonaws.com/uploads/curriculums//61cab2db717e71e488b118f2d7ca01a2.png

つまり、メソッドの中では、その中で定義した変数だけが使えます。

なぜこのような決まりがあるのでしょうか。
スコープの概念がなかった場合を考えてみましょう。以下の図を見てください。

https://tech-master.s3.amazonaws.com/uploads/curriculums//af8923ad1b6d6c4dbc1cb970b65cedfc.png

もしメソッドの中と外で同じ変数名が使われたとき、
「はじめて変数を定義したつもりが、再代入していた」ということが起こってしまい、その変数の箇所で処理に何らかの意図しない影響が出てしまいます。

そのため、変数を使える範囲は、メソッドの内と外で分けられているのです。

外から値を受け取る変数を用意しよう
スコープによって、変数には扱える範囲が決まっていることを学びました。
では、メソッドの外の変数が持つ値をメソッドの中で使用することはできないのでしょうか。

ここで、メソッドが外から値を受け取る引数という仕組みを学びましょう。

 引数ひきすう
引数は、メソッドなどに渡すことのできる値のことです。
引数によって、メソッドは外にある変数（スコープ外の変数）の値をメソッドの中で扱うことができます。

メソッド定義時に()の中に記述しておき、処理に利用する仮引数と、
メソッドを呼ぶ際に()の中に渡す値を記述する実引数（または本引数）があります。

【例】実引数と仮引数
1
2
3
4
5
6
def メソッド名(仮引数)
  # 処理
end

# メソッドの呼び出し
メソッド名(実引数)
これだけだとイメージができないので、実際のコードを見てみましょう。

メソッドは、実引数に書かれた値を仮引数の名前で扱うことができます。
以下は、引数を用いたメソッドの記述例です。

【例】実引数と仮引数の使用
1
2
3
4
5
def sample(number)  # ②仮引数numberで、実引数「3」の値を受け取る
  puts number * number  # ③「3」が代入されたnumberを使って「3 * 3」を行い出力する
end

sample(3)  # ①数値「3」を実引数にしてメソッドを呼び出し
実行すると、メソッドが実引数から受け取った値「3」をnumberとして扱って2乗し、結果の「9」が出力されます。

実引数と仮引数の名前は、同じでも別の名前でも動作に違いはありません。
これは、実引数に変数を使った場合も同じです。

【例】実引数と仮引数の名前
1
2
3
4
5
6
7
def sample(value)  # 仮引数は「value」
  puts value * value
end

number = 3

sample(number)  # 実引数は「number」
実引数はnumber、仮引数はvalueとなっています。
これでも先ほどと同様に結果は「9」が出力されます。

また、引数は複数用意でき、左から順に「第一引数」「第二引数」...「第○引数」と呼びます。

【例】引数の呼び方
1
2
3
4
5
def メソッド名(第一引数, 第二引数)
  # 処理
end

メソッド名(第一引数, 第二引数)
実引数と仮引数の数は、必ず一致している必要があります。
引数の数が一致していない場合は、エラーが生じますので注意しましょう。

これで、メソッドの定義についてすべて学習しました。
以下の図にメソッドの呼び出し元と定義部分の関係をまとめます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//56aa27989d3b41a8ff256960b9f25f04.png

メソッドを定義してみましょう。

 method.rbを編集しましょう
それでは、引数を持つメソッドを定義して、
メソッド外の変数の値をメソッド内で使ってみましょう。

ruby/method.rb
1
2
3
4
5
6
7
8
9
def mixer(fruit)
  puts "#{fruit}を細かく砕く"
  return "#{fruit}ジュース"
end

puts "フルーツを入力してください"
input = gets.chomp

puts mixer(input)
ファイルの編集が終わったら、
以下のコマンドでファイルを実行しましょう。

ターミナル
1
2
3
4
5
# rubyディレクトリに移動
% cd ~/ruby

# method.rbを実行
% ruby method.rb
実行して、以下のように入力すると、その値を元にした出力が行われます。

【例】ターミナル
1
2
3
4
5
6
フルーツを入力してください
apple  # 入力

# 以下のような出力がされる（「apple」を入力した例）
appleを細かく砕く
appleジュース
メソッドを呼び出すときの括弧()は省略できます。
実は、これまでputsメソッドも括弧を省略して使用していました。
puts("文字列")としても出力ができますので、興味があれば試してみてください。

本章で学んだメソッドと引数は、プログラミングを学ぶ上で非常に重要な概念です。
動画で引数とメソッドについておさらいしましょう。


times,eachメソッドのスコープ
times,eachメソッドのスコープ範囲は、def〜endで定義するメソッドと違いがあります。

スコープ範囲の違い

defで定義するメソッドのスコープ	times,eachメソッドのスコープ
メソッドの外で定義した変数	（引数を使わない限り）メソッドの中で使用できない	メソッドの中で使用できる
メソッドの中で定義した変数	メソッドの外で使用できない	メソッドの外で使用できない
どういうことかコードを見比べながら学習しましょう。

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
num = 1
lists = [1, 2, 3]

lists.each do |list|
 num = num +list
end

puts num

# 出力結果
7
こちらのコードではeachメソッドの外で変数numを定義していますが、問題なく処理が行われます。

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
lists = [1, 2, 3]

lists.each do |list|
 num = 1
 num = num + list
end

puts num

# エラーが出る
こちらのコードでは、変数numの定義をeachメソッドの中で行なっており、メソッドの外で出力をしているためエラーが出てしまいます。
２つの違いをしっかり理解しておきましょう。

ミニアプリ作成
本章で学んだ内容を使って、roller_coaster.rbの開発を進めましょう。
まずは、以下の動画を視聴し、この後実装する開発の概要を掴みましょう。



処理をまとめよう
現在のroller_coaster.rbは、入力と出力の処理を分けたことで、はじめと比べるととても読みやすくなっている状態です。

しかし、まとまった処理には名前をつけてメソッドとして定義しておくべきです。

なぜなら、プログラムは処理の結果が大切であり、処理の過程が見えている必要はないためです。もし過程となる処理の中身を意識するときにも、それらはまとまっていた方が読みやすくなります。

また、メソッドを定義すればその中の変数や処理は、スコープによって他の処理に影響を与えないことがわかっているため、安心してコードを書きやすくなります。

このように、処理をメソッドとしてまとめることは、コードを書く上ではとても大切です。

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
ride_count = 0
friends = []

3.times do
  friend = {}
  puts "お友達の名前は？"
  friend[:name] = gets.chomp
  puts "お友達の身長は？"
  friend[:height] = gets.to_i
  friends << friend
end

friends.each do |friend|
  if friend[:height] >= 130
    puts "#{friend[:name]}くんは乗車できます"
    ride_count += 1
  else
    puts "#{friend[:name]}くんは乗車できません！"
  end
end

puts "乗車するのは#{ride_count}人です"
まとまった処理をメソッドとして定義して、再利用できる状態に書き換えましょう。

 roller_coaster.rbを編集しましょう
まずは、入力を行う処理の部分をメソッドとして切り出します。

【例】ループ内の入力部分
 5
 6
 7
 8
 9
10
  friend = {}
  puts "お友達の名前は？"
  friend[:name] = gets.chomp
  puts "お友達の身長は？"
  friend[:height] = gets.to_i
  friends << friend
以下のようにメソッドを定義し、ループ内で呼び出すように編集してください。

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
ride_count = 0

def add_friend(list)
  friend = {}
  puts "お友達の名前は？"
  friend[:name] = gets.chomp
  puts "お友達の身長は？"
  friend[:height] = gets.to_i
  list << friend
end

friends = []

3.times do
  friends = add_friend(friends)
end

friends.each do |friend|
  if friend[:height] >= 130
    puts "#{friend[:name]}くんは乗車できます"
    ride_count += 1
  else
    puts "#{friend[:name]}くんは乗車できません！"
  end
end

puts "乗車するのは#{ride_count}人です"
入力の処理をadd_friendというメソッドとして定義して、繰り返し処理の中で呼び出すように変更しました。

add_friendメソッドは、引数で配列を受け取ると、名前と身長の情報を持つハッシュを作り出し引数の配列に追加します。最後にその引数の配列を呼び出し元へ返します。

続いて出力部分をメソッドとして切り出しましょう。

 roller_coaster.rbを編集しましょう
最後に、条件分岐と出力を行う処理の部分をメソッドとして切り出します。

【例】配列ループと条件分岐、出力の部分
18
19
20
21
22
23
24
25
friends.each do |friend|
  if friend[:height] >= 130
    puts "#{friend[:name]}くんは乗車できます"
    ride_count += 1
  else
    puts "#{friend[:name]}くんは乗車できません！"
  end
end
ride_countもメソッド内でしか使用しないため、メソッドで定義するように編集します。
以下のようにメソッドを定義してください。

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
def judge_height(list)
  ride_count = 0

  list.each do |friend|
    if friend[:height] >= 130
      puts "#{friend[:name]}くんは乗車できます"
      ride_count += 1
    else
      puts "#{friend[:name]}くんは乗車できません！"
    end
  end

  puts "乗車するのは#{ride_count}人です"
end

def add_friend(list)
  friend = {}
  puts "お友達の名前は？"
  friend[:name] = gets.chomp
  puts "お友達の身長は？"
  friend[:height] = gets.to_i
  list << friend
end

friends = []

3.times do
  friends = add_friend(friends)
end

judge_height(friends)
入力と出力の処理をメソッドとして切り出すことができました。

 ターミナルでroller_coaster.rbを実行しましょう
挙動を確認するために、ターミナルで実行しましょう。前章と結果は変わりませんが、コードは読みやすくまとめられています。

https://tech-master.s3.amazonaws.com/uploads/curriculums//5846a82bd21c5c90f09f34fe9d9fee36.png

これで、roller_coaster.rbは完成です。最後に、roller_coaster.rbの処理の流れを簡単に振り返ってみましょう。

25行目でfriendsという配列を用意し、27〜29行目で繰り返しadd_friendメソッドを呼び出しています。
その際、実引数として配列friendsを16行目の仮引数listに渡し、add_friendメソッド内の処理を実行していきます。
最後に、31行目で配列friendsを実引数として、1行目の仮引数listに値を渡し、judge_heightメソッド内の処理を呼び出し、実行していきます。
厳しく見るとまだ改善できる部分はありますが、これまで学んだRubyの基礎とプログラミングにおける考え方を理解できていれば、十分に素晴らしい成果と言えます。

次章からは、より複雑に値と処理の組み合わせを利用するアプリケーションの作成に必要となる、大切な仕組みと考え方を学びます。
