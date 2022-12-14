10.times do |i|
  puts "#{i + 1}回目の繰り返し"
end

問題.1
times文を使って、以下のようにターミナルに出力されるプログラムを書いてください。

ターミナル
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
1回目の繰り返し
2回目の繰り返し
3回目の繰り返し
4回目の繰り返し
5回目の繰り返し
6回目の繰り返し
7回目の繰り返し
8回目の繰り返し
9回目の繰り返し
10回目の繰り返し
回答
1
解答を貼り付けてください。
1
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
解答
1
2
3
10.times do |i|
  puts "#{i + 1}回目の繰り返し"
end
解説
times文を使えば、何度も繰り返される同じ処理をまとめることができます。今回まとめられるのは◯回目の繰り返しとターミナルに出力する部分です。

times文は繰り返したい回数.timesと記載して繰り返す数を決めます。今回は10回繰り返すので10.timesとなります。

1
2
10.times
end
10.timesとendの間に、◯回目の繰り返しとターミナルに出力する処理を記述します。出力にはputsメソッドを使います。一旦そのまま◯回目の繰り返しとして処理を書いてみます。

1
2
3
10.times
  puts "◯回目の繰り返し"
end
この◯の部分は繰り返しの回数が入ります。どうしたら繰り返しの回数を◯の部分に入れることができるでしょうか。

times文には繰り返しの中で「現在の繰り返し回数」を使うための機能があります。それが繰り返しの回数.times do |変数名|です。変数名の箇所は自由ですが、今回はiとしておきます。


10.times do |i|
  puts "◯回目の繰り返し"
end
この変数iは、10.times do |i|とendの間だけで使える変数です。つまり繰り返しの処理の中でしか使えません。ではiに何が入るのかというと「現在の繰り返し回数」が入ります。プログラムなので、1回目の繰り返しではiは0になります。2回目はiは1です。3回目はiは2です。



よって、1回目の繰り返しで1回目の繰り返しと出力するには、(i + 1)回目の繰り返しとすれば良いことになります。

10.times do |i|
  puts "#{i + 1}回目の繰り返し"
end
採点方法
10.timesとendが正しく書かれていれば+5点
変数i(変数名はiでなくても良い)を使って繰り返しの回数を出力できてれば+3点

