class Human

end

class Human

end

adam = Human.new

puts adam


問題.1
「Human」という名前のクラスを作成してください。
なお、クラスは何の情報も持たないもっともシンプルな形で定義してください。

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
class Human

end
解説
クラスの定義はclass クラス名からはじめてendで終わります。

1
2
3
class クラス名
  # クラスで共通する特徴やメソッドの定義
end
今回はクラス名がHumanです。クラス名は先頭の文字を大文字の英語で始めます。2文字目以降は小文字です。
よってクラスの定義は以下になります。

1
2
3
class Human

end
今回は情報を持たないもっともシンプルな形なので、これで終了です。

採点方法
class Humanとendを使って正しくクラスの定義ができていれば5点。それ以外は0点。

この回答の点数を入力してください。
0
点配点5点
問題.2
問題1で作成したHumanクラスのインスタンスを生成するプログラムを書いてください。

回答
1
解答を貼り付けてください。
1
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
解答
1
Human.new
もしくは変数を使って

1
human = Human.new
解説
インスタンスの生成はクラス名.newで行います。引数なしのため、newとしてもnew()としてもどちらでも問題ありません。

今回はクラス名がHumanなので、以下のような形になります。

1
Human.new
()を付けた以下の書き方でも正解です。

1
Human.new()
採点方法
解答と同じソースコードであれば5点。それ以外は0点。
