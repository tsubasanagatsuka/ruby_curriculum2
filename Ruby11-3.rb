class Student
  def set_name(name)
    @name = name
  end

  def introduce
    puts "私の名前は#{@name}です。"
  end
end

student = Student.new
student.set_name("山田太郎")
student.introduce


問題.1
以下のプログラムを実行するとエラーが起きます。
①エラーが起きた原因
②正しいソースコード
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
 9
10
11
12
13
class Student
  def set_name(name)
    @name = name
  end

  def self.introduce
    puts "私の名前は#{@name}です。"
  end
end

student = Student.new
student.set_name("山田太郎")
student.introduce
回答
1
解答を貼り付けてください。
1
# コードブロックは上のように```の直後に言語名を指定してください。
模範解答
解答
①エラーが起きた原因
Studentクラスのメソッドintroduceがインスタンスメソッドではなくクラスメソッドになってしまっていること（メソッドの定義にself.がついている）。

②正しいソースコード
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
class Student
  def set_name(name)
    @name = name
  end

  def introduce
    puts "私の名前は#{@name}です。"
  end
end

student = Student.new
student.set_name("山田太郎")
student.introduce
解説
クラスメソッドとインスタンスメソッドを間違えたことによりエラーが起きた問題です。

問題文のソースコードでは、introduceメソッドはdef self.introduceと定義されており、クラスメソッドになっています。
※クラスメソッドはメソッド名の先頭にself.をつけたメソッドです。

問題文のソースコード
1
2
3
def self.introduce
  puts "私の名前は#{@name}です。"
end
問題文の最後の行では、このクラスメソッドintroduceをインスタンスが呼び出してしまっています。クラスメソッドはインスタンスからは呼び出せないので、エラーになります。

問題文のソースコード
1
student.introduce # introduceメソッドはクラスメソッドなのでインスタンスstudentからは呼び出せない
introduceメソッドの処理を見ると、インスタンス変数@nameが使われています。@が先頭についた変数はインスタンス変数となり、インスタンスメソッド全てで同じ値が使えるようになります。

今回の問題では以下のインスタンスメソッドset_nameで、インスタンス変数@nameに生徒の名前を代入しています。
※set_nameメソッドはself.がついていないので、インスタンスメソッドです。

問題文のソースコード
1
2
3
def set_name(name)
  @name = name # 引数のnameをインスタンス変数@nameに代入
end
問題文のソースコード
1
2
student = Student.new # Studentクラスのインスタンスを作る
student.set_name("山田太郎") # インスタンスメソッドset_nameを呼び出し
set_nameメソッドの@name = nameの箇所では、引数として渡されてきた"山田太郎"という文字列をインスタンス変数@nameに代入しています。
これで、他のインスタンスメソッドの中でも@nameと書くと"山田太郎"という値が使える状態になります。

しかし、クラスメソッドではインスタンス変数は使えません。よってintroduceメソッドの中のputs "私の名前は#{@name}です。"という処理はクラスメソッドの状態では使えないことになります。

問題文のソースコード
1
2
3
def self.introduce
  puts "私の名前は#{@name}です。" # @nameはクラスメソッド内では使えない
end
そこでintroduceメソッドをクラスメソッドからインスタンスメソッドに変更します。self.を削除するだけです。

1
2
3
def introduce
  puts "私の名前は#{@name}です。"
end
これでintroduceメソッドはインスタンスメソッドになり、puts "私の名前は#{@name}です。"はputs "私の名前は山田太郎です。"という意味になります。

更にintroduceメソッドの呼び出しはインスタンスから行えるようになったので、student.introduceの箇所も動くようになります。

正しいソースコード
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
class Student
  def set_name(name)
    @name = name
  end

  def introduce
    puts "私の名前は#{@name}です。"
  end
end

student = Student.new
student.set_name("山田太郎")
student.introduce
