2-1
# "ミニアプリ作成"

"ようこそ！名前を入力してください"

"秒数を知りたい時間を分単位で入力してください"

"タロウさん、#{5}分は#{5 * 60}秒です！"

# ミニアプリ作成
# 概要で紹介したミニアプリを、本章で学んだ内容を元に実装を進めます。

# ミニアプリ用のRubyファイルを作成しよう
# 秒数を表示するアプリなので、簡単に「seconds.rb」という名前にします。

# 新規Rubyファイルを作成しましょう
# ホームディレクトリ内のrubyディレクトリに「seconds.rb」という名前のファイルを作成しましょう。

# 以下のような状態になるはずです。

# 作成後finder

# 文字列を用意しよう
# seconds.rbは入力された分単位の時間を、秒数に変えて表示するアプリです。
# 今回の章では、入力を促すための案内となる文字列を用意しましょう。

# seconds.rbを編集しましょう
# 今回は文字列を用意するだけです。

# ruby/seconds.rb

# "ようこそ！名前を入力してください"

# "秒数を知りたい時間を分単位で入力してください"

# "タロウさん、#{5}分は#{5 * 60}秒です！"
# 文字列を並べました。数値となる部分は式展開で文字列に含めています。

# このアプリは、章を進めるごとに開発していきます。

# irbで確認しましょう
# まだアプリの開発は途中ですが、現状のコードをirbで実行します。以下の動画のとおり、コードをコピー&ペーストして実行し、最後の結果が"タロウさん、5分は300秒です！"となることを確認しましょう。

# https://tech-master.s3.amazonaws.com/uploads/curriculums//e1d533b1ce61215df7aad2f85eeb13c2.gif

# もし、想定通りの出力がされない場合は、以下の可能性があります。確認しましょう。

# irbを起動できていない（最初にirbとコマンドを入力しないとirbは起動しません）
# 式展開 #{ }が全角になっている（式展開は半角で記述します）
