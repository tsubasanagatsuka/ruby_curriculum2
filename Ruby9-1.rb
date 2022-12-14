def introduce
  puts "私の名前はテックキャンプです"
end
introduce

def math(input)
  puts (input) * 2
end

puts "入力"
input = gets.to_i
math(input)

TECH::MASTER
カリキュラム検索
終了まで0日

コース
ID:38004 長塚 翼

長塚 翼
【練習問題 Ruby】処理に名前をつけて使おう① - 自己採点ページ
問題.1
以下のメソッドを作成してください。

メソッド名
introduce

メソッドの処理
私の名前はテックキャンプです。とターミナルに出力する。

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
def introduce
  puts "私の名前はテックキャンプです。"
end
解説
メソッドを作成する場合には、以下のようにプログラムを書きます。

1
2
3
def メソッド名
  # メソッドの処理
end
今回はメソッド名をintroduceにするため、メソッドの定義は以下のようになります。

1
2
3
def introduce
  # メソッドの処理
end
メソッドの処理はdef メソッド名とendの中に記述します。今回はターミナルに文字を出力するのでputsメソッドを使います。

1
2
3
def introduce
  puts "私の名前はテックキャンプです。"
end
なお、問題の条件はメソッドを作成するのみなので、メソッドを呼び出す記述は不要です。もし自身のターミナルで挙動を確認したい場合は以下のように記述し、実行します。

1
2
3
4
5
6
def introduce
  puts "私の名前はテックキャンプです。"
end

# メソッドの呼び出し
introduce
採点方法


問題.2
以下のメソッドを作成してください。

メソッド名
double

メソッドの処理
処理1：ターミナルから数値を入力させる
処理2：入力した数値を2倍にした値を戻り値にする

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
4
def double
  num = gets.to_i
  num * 2
end
もしくはreturnを使って

1
2
3
4
def double
  num = gets.to_i
  return num * 2
end
解説
まず、メソッドの定義をします。今回はメソッド名がdoubleなので定義は以下のようになります。

1
2
3
def double
  # メソッドの処理
end
次にメソッドの処理を考えます。今回のメソッドの処理は大きく分けて2つあります。
処理1：ターミナルから数値を入力させる
処理2：入力した数値を2倍にした値を戻り値にする

処理1：ターミナルから数値を入力させる
まずターミナルから数値を入力させます。ターミナルに文字を入力するときはgetsメソッドを使います。

1
2
3
def double
 num = gets
end
getsメソッドで入力した文字は全て文字列となります。そこで文字列を数値に変換するto_iメソッドを使って、getsメソッドで入力した文字を数値に変換します。

1
2
3
def double
 num = gets.to_i
end
処理2：入力した数値を2倍にした値を戻り値にする
戻り値というのは、メソッドを呼び出したあとに取得される値です。メソッドでは、以下のどちらかの値が戻り値となります。
①メソッドの処理の最後に書かれた値
②return文を使って指定された値

まず①のようにメソッドの最後の値が基本的に戻り値になります。よって以下のようにnum * 2をメソッドの最後に記載すれば、numを2倍した値が戻り値になります。

1
2
3
4
def double
  num = gets.to_i
  num * 2
end
もしくはreturn文を使っても良いです。return文はreturn 値とすれば、たとえメソッドの最後でなくても、その値を戻り値にできます。

1
2
3
4
def double
  num = gets.to_i
  return num * 2
end
Rubyではreturn文を使わずに、単に戻り値をメソッドの最後に記載することが一般的です。


