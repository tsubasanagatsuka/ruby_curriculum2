ride_count = 0
friends = []

puts "お友達の名前は？"
friends << gets.chomp
puts "お友達の身長は？"
friends << gets.to_i
ride_count += 1

puts "お友達の名前は？"
friends << gets.chomp
puts "お友達の身長は？"
friends << gets.to_i
ride_count += 1

puts "お友達の名前は？"
friends << gets.chomp
puts "お友達の身長は？"
friends << gets.to_i
ride_count += 1

puts "乗車するのは#{ride_count}人です"

配列で情報を管理しよう
roller_coaster.rbは、複数人を1人ずつジェットコースターに乗れるか身長によって判断するアプリです。
まずは、配列に名前と身長を追加します。

roller_coaster.rbを編集しましょう
名前、身長の情報を配列に追加します。
また、乗車できる人数を管理する変数ride_countも用意します。

入力の案内も出力しておきましょう。

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
ride_count = 0
friends = []

puts "お友達の名前は？"
friends << gets.chomp
puts "お友達の身長は？"
friends << gets.to_i
ride_count += 1

puts "お友達の名前は？"
friends << gets.chomp
puts "お友達の身長は？"
friends << gets.to_i
ride_count += 1

puts "お友達の名前は？"
friends << gets.chomp
puts "お友達の身長は？"
friends << gets.to_i
ride_count += 1

puts "乗車するのは#{ride_count}人です"
まずは、乗車人数を持つ変数ride_countと、名前と身長の情報を持つ変数friendsを配列として用意しておきます。

getsで入力を求めたあと、配列に情報を追加します。
追加を終えるたびに、ride_countの値を1ずつ追加しています。

ターミナルでroller_coaster.rbを実行しましょう
ターミナルで実行しましょう。以下のように、合計6回のgetsによる入力を経た後に、乗車人数が出力されることを確認しましょう。

https://tech-master.s3.amazonaws.com/uploads/curriculums//c997ddefb0022659a166137c78550472.png

現在、全員が乗車できる状態です。さらに、配列は値を順番で管理するものであるため、別々の意味を持つ値の管理には向いていません。取得のときには何番目に名前、身長が入っているか把握する必要があるためです。これらは次章以降に直しましょう。

