price = 300

def calculate_price_with_tax(price)
  tax = 0.1
  puts price + price * tax
end

calculate_price_with_tax(price)

# ①エラーが起きた原因 priceが変数として手if￥技されているのでメソッド内で使えるように日引数として使う。仮日数が設定されていない

# ②正しいソースコード（引数を用いたコードにしましょう）


問題.1
以下のプログラムを実行するとエラーが起きます。
①エラーが起きた原因
②正しいソースコード（引数を用いたコードにしましょう）
をそれぞれ答えてください。

実行したプログラム
1
2
3
4
5
6
7
8
price = 300

def calculate_price_with_tax
  tax = 0.1
  puts price + price * tax
end

calculate_price_with_tax
回答
1
解答を貼り付けてください。
1
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
解答
①エラーが起きた原因
メソッドの外側で定義した変数は、メソッドの内側では使えない。そのため、1行目のpriceはcalculate_price_with_taxメソッドの中では使えずにエラーが起きてしまった。

②正しいソースコード
1
2
3
4
5
6
7
8
price = 300

def calculate_price_with_tax(price)
  tax = 0.1
  puts price + price * tax
end

calculate_price_with_tax(price)
解説
メソッドの中と外は完全に別の世界となっています。そのため、メソッドの中から外にある変数を使ったり、逆にメソッドの外から中にある値を使うことはできません。

唯一、メソッドの中と外を繋ぐ役割が「引数」と「返り値」です。

それを踏まえて今回の問題を解説していきます。

①エラーが起きた原因
解答の通り、エラーが起きた原因は変数priceです。今回の問題文のソースコードには変数priceが2度出てきます。

メソッドの外にある1行目のprice = 300と、メソッドの中にある5行目のprice + price * taxです。

問題文のソースコード
1
2
3
4
5
6
price = 300

def calculate_price_with_tax
  tax = 0.1
  puts price + price * tax
end
メソッドの中では、メソッドの外の変数を使うことができません（変数の使える範囲をスコープと言います）。

よって今回の問題文のソースコードでは、変数priceの定義はメソッドの外で行なっていたにも関わらず、メソッドの中で変数priceをそのまま使おうとしたことがエラーの原因でした。

②正しいソースコード
ではどうすればいいのでしょうか。
スコープの問題を解決するのが、メソッドの中と外を繋ぐ役割を持つ「引数」と「返り値」です。

①メソッドの外から中に値を渡す役割が「引数」
②メソッドの中から外に値を渡す役割が「返り値」

今回は、メソッドの外から中に変数priceを渡すことで問題は解決します。つまり、解決に必要なのは①の「引数」です。

引数の使い方は大きく2ステップです。

メソッドの呼び出しをメソッド名(渡したい値)と書く
メソッドの定義をdef メソッド名(受け取った値を入れる変数名)と書く
では今回の問題に当てはめてみましょう。

1. メソッドの呼び出しをメソッド名(渡したい値)と書く
今回、calculate_price_with_taxメソッドに渡したい値は変数priceなので、以下のようにメソッドを呼び出します。

1
calculate_price_with_tax(price)
2. メソッドの定義をdef メソッド名(受け取った値を入れる変数名)と書く
今回は値段の値を受け取りたいので、変数名はpriceにします。今回はメソッドの外の変数名priceと一緒ですが、別の名前にしても大丈夫です。

1
2
3
4
def calculate_price_with_tax(price)
  tax = 0.1
  puts price + price * tax
end
よって引数を使って以下のように書き換えれば、問題文のソースコードのエラーは解決します。

1
2
3
4
5
6
7
8
price = 300

def calculate_price_with_tax(price)
  tax = 0.1
  puts price + price * tax
end

calculate_price_with_tax(price)

