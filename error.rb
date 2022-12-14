#   ↓ここに全角スペースがある
puts　"Hello World"


よく起こるエラーを確認しよう
エラーとは、プログラムに何か問題がある状態を指す言葉です。エラーが生じている場合は、プログラムは実行できない状態になっています。

プログラミングにエラーはつきものです。その中でも、はじめのうちに起こしやすいエラーを紹介します。以下で紹介するエラー要因に気をつければ、効率良く学習をすることができるでしょう。

全角スペースの使用
スペル間違い
ディレクトリ違い
error.rbを作成しましょう
エラーを確認するためのRubyファイルを作成します。
helloworld.rbと同じ要領で、rubyディレクトリにerror.rbを作成します。

VSCodeを開く → command[⌘] + N → command[⌘] + S →
名前に「error.rb」を記入 → ホームディレクトリのrubyディレクトリを選択 → [保存]を選択

error.rb作成gif

このファイル作成の流れは、今後は案内を省略します。しっかり覚えておきましょう。

error.rbに以下のコードを書いて実行しましょう
全角スペースによるエラーを確認するために、あえて間違ったソースコードを書いてみましょう。
putsと"Hello World"の間の空白を全角スペースにしてください。

ruby/error.rb

#   ↓ここに全角スペースがある
puts　"Hello World"
全角スペースがプログラム中に混入すると実行時にエラーが生じます。
分かりづらいですが、putsと"Hello World"の間にある空白が全角スペースになっています。

実行すると以下のようなエラー文と、Did you mean?という代替案が表示されます。

【例】ターミナル

% ruby error.rb
Traceback (most recent call last):
error.rb:1:in `<main>': undefined method `puts　' for main:Object (NoMethodError)
Did you mean?  puts
               putc
はじめのうちは見つけづらく、頻繁に起こるエラーなので、全角スペースには注意しましょう。また、全角スペース同様、日本語がプログラム中に混入すると実行時にエラーが生じます。

VS Codeの拡張機能によって、全角スペースには灰色のハイライトがつくので、見つけたら必ず修正しましょう。

それでは、他のエラーも確認しましょう。

error.rbに以下のコードを書いて実行しましょう
スペルの間違いによるエラーを確認しましょう。先ほどのソースコードをすべて消して、以下のコードを書いてみましょう。

ruby/error.rb

# 「put」になってしまっている
put "Hello World"
多少のスペルミスを柔軟に解釈できる人間とは異なり、コンピュータには1つも間違いのない正しいスペルで記述し命令する必要があります。
記述したコードは、本来「puts」とするべきところを「put」と記述していて、sが抜けてしまっています。
こうした名前を打ち間違えてしまいエラーが生じることはよくあります。

実行すると以下のようなエラー文と、Did you mean?という代替案が表示されます。

【例】ターミナル

% ruby error.rb
Traceback (most recent call last):
error.rb:1:in `<main>': undefined method `put' for main:Object (NoMethodError)
Did you mean?  puts
               putc
最後にもう1つ、他のエラーを確認しましょう。

ターミナルで以下のコマンドを実行しましょう
ディレクトリが違うことによるエラーを確認しましょう。

ターミナル

# カレントディレクトリのパスを確認
% pwd

# カレントディレクトリ直下のファイルを確認
% ls
error.rb    helloworld.rb  # ファイルが表示される

# カレントディレクトリには存在しないファイルを実行（エラーが表示される）
% ruby hoge.rb
Traceback (most recent call last):
ruby: No such file or directory -- hoge.rb (LoadError)
指定したパスにファイルが存在しない場合は、エラーが生じます。
原因として考えられるのは、ファイル名を間違えていることや、今いるディレクトリを間違えている可能性があるので、注意しましょう。

ここまで、「全角スペース」「スペル間違い」「ディレクトリ違い」というエラーの原因に関して学びました。はじめのうちはほとんどの場合これらが原因でエラーを起こすので、真っ先にチェックするようにしましょう。
