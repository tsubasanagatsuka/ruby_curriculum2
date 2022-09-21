
概要
この章では、新しい種類の値を作る仕組み、クラスとインスタンスを学びます。

今回から専門用語が増えて難しく感じることが多いかと思いますが、これらはエンジニア同士のコミュニケーションを円滑に進めるためには覚えるべき用語なので、しっかり理解して覚えておきましょう。

目的
クラスの役割と定義方法を理解すること
インスタンスの役割と生成方法を理解すること
事前準備
サンプルコード用のRubyファイルを作成しよう
学習に使用するRubyファイルを作成します。

 新規Rubyファイルを作成しましょう
以下のように、rubyディレクトリに「class.rb」というファイルを作成してください。

 ホームディレクトリ
 ruby
 class.rb
クラスとインスタンス
クラスとインスタンスの概要を学ぼう
これまで使っていた文字列や数値などの値は、よく使われるためRubyに初めから定義されていました。

実は、これまで扱っていた値とは別に、自分で新しい種類の値を作ることができます。

https://tech-master.s3.amazonaws.com/uploads/curriculums//5e42ff864ea454710858b30c98199d83.png

新しい種類の値を作るために必要な概念が、クラスとインスタンスです。
本章では、この概念を1つずつ学びます。

データの元となる設計図を作ろう
まず、新しい種類の値を作る前に、これまでの値を振り返ります。
値は種類ごとに役割や使用できるメソッドが異なりました。

https://tech-master.s3.amazonaws.com/uploads/curriculums//20d2c017b13d82513f3c8f306a66fda6.png

新しい種類の値を作るときは、その値のルールを決める必要があります。
値の共通のルールを決めておくクラスを学びましょう。

 クラス
クラスは、値の元となるものです。値の共通のルールを定義します。
ここで決めるルールは、共通の属性と処理（メソッド）です。

クラスを使えば、文字列が「こんにちは」や「どうも」という別々のデータを持つことができることと同じように、共通のルールを守った上で個別のデータを作ることもできます。

共通の情報をまとめ、個別の情報は各データごとに分けることで、開発・管理・保守がし易くなるという利点があります。

クラスは設計図に例えることができます。以下の車の製造を表した図を見てください。

車の設計図

設計図があり、そこから実体のある車が生まれます。
クラスとは簡単に言ってしまえばひな形と言え、車で言えば車の設計図となるものです。

クラスは、共通の属性と処理を決めるだけで、実体がありません。
そのため、クラス単体ではデータを扱うことはできません。車の設計図だけでは、車は運転できないことと同じです。

クラスの定義は以下のように行います。

【例】クラスの定義
1
2
3
class クラス名
  # 変数やメソッドの定義
end
クラス名は半角英大文字から始めます。
例: User, Account, Image, Group, など

 class.rbにクラスを定義しましょう
今回定義するクラスは、Carクラスです。

class.rb
1
2
3
class Car

end
これで、何の情報も持たないもっともシンプルなクラスの定義ができました。
次章からここに機能を拡張しますので、本章では何の記述もない状態にしておきます。

設計図からデータを作ろう
クラスを定義できました。しかし、クラスだけでは何もデータを扱うことはできません。
クラスから生成される、データを持ったインスタンスという値を学びましょう。

 インスタンス
インスタンスとは、クラスを元にして作られるデータのことです。

インスタンスは、クラスと異なり実体を持ちます。
車の設計図の例で言えば、設計図から作られて実際に販売されている車を指します。

車の設計図

インスタンスは、クラスが使用できるnewメソッドを実行して生成します。

 newニューメソッド
クラスは、定義しなくてもnewという特別なメソッドをはじめから持っています。
newメソッドは、使用したクラスのインスタンスを生成して返します。

使い方は以下のようにクラス名に続けて使用します。

【例】newメソッド
1
2
# インスタンスを生成し変数で扱う
変数名 = クラス名.new
多くの場合、インスタンスを生成したら、再利用するために変数へ代入します。
これは、インスタンスを生成したあとからデータを追加したり、メソッドを実行できるようにするためです。

 class.rbでインスタンスを生成しましょう
newメソッドを使ってインスタンスを生成します。

class.rb
1
2
3
4
5
6
class Car

end

fire_truck = Car.new  # Carクラスのインスタンスを生成
puts fire_truck  # インスタンスを出力
このように、クラスの定義と通常のRubyの記述は同じファイル内に書くことができます。
続いて、ターミナルからclass.rbを実行しましょう。

ターミナル
1
2
3
4
5
# Rubyファイルの実行
% ruby class.rb

# 以下のような表示がされればOK
#<Car:0x00XXXXXXXXXXXXXX>
上記のように表示されればCarクラスのインスタンスの生成に成功しています。

これで、この作成したクラスからインスタンスを生成できるようになりました。

newメソッド

本章では、空のクラスを作り、何の情報も持たないインスタンスを生成しただけです。
値がどのようなデータやメソッドが使用できるかのルールをクラスに記述していないため、生成されたインスタンスはまだ何もできません。

以下の動画では、今回紹介した車以外の例でクラスとインスタンスを説明しています。クラスとインスタンスのイメージをつかんでおきましょう。



