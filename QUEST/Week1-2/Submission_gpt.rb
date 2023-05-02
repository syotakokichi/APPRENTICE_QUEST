# Rubyでブラックジャックをオブジェクト指向を使って実装しましょう。オブジェクト指向でプログラムを作成した実績を作るのが目的です。

# ブラックジャックはカジノで行われるカードゲームの一種です。1〜13までの数が書かれたカード52枚を使ってゲームが行われます。ルールは次の通りです。

# 実行開始時、ディーラーとプレイヤー全員に２枚ずつカードが配られる
# 自分のカードの合計値が21に近づくよう、カードを追加するか、追加しないかを決める
# カードの合計値が21を超えてしまった時点で、その場で負けが確定する
# プレイヤーはカードの合計値が21を超えない限り、好きなだけカードを追加できる
# ディーラーはカードの合計値が17を超えるまでカードを追加する
# 各カードの点数は次のように決まっています。

# 2から9までは、書かれている数の通りの点数
# 10,J,Q,Kは10点
# Aは1点あるいは11点として、手の点数が最大となる方で数える
# このゲームには何人かのプレイヤーがおり、カードの合計値を競います。なお、実装する際には次の点を守るようにしてください。

# 静的解析ツールは一通り通る状態にしておきましょう
# 変更しづらかったり読みづらい箇所は何度も書き直しましょう
# ステップ1
# ディーラーとプレイヤーの2人で対戦するコンソールゲームを作成しましょう。以下のルールの元、コンソール（ターミナル）上で動作するようにします。

# プレイヤーは実行者、ディーラーはCPUが自動実行する
# 実行開始時、プレイヤーとディーラーはそれぞれ、カードを2枚引く。引いたカードは画面に表示する。ただし、ディーラーの2枚目のカードは分からないようにする
# その後、先にプレイヤーがカードを引く。プレイヤーのカードの合計値が21を超えたらプレイヤーの負け
# プレイヤーはカードを引くたびに次のカードを引くか選択できる
# プレイヤーがカードを引き終えたら、ディーラーは自分のカードの合計値が17以上になるまで引き続ける
# プレイヤーとディーラーが引き終えたら勝負。カードの合計値が21により近い方が勝ち
# Aは1点として取り扱う
# コンソール画面のイメージは次の通りです。

# ブラックジャックを開始します。
# あなたの引いたカードはハートの7です。
# あなたの引いたカードはクラブの8です。
# ディーラーの引いたカードはダイヤのQです。
# ディーラーの引いた2枚目のカードはわかりません。
# あなたの現在の得点は15です。カードを引きますか？（Y/N）
# Y
# あなたの引いたカードはスペードの５です。
# あなたの現在の得点は20です。カードを引きますか？（Y/N）
# N
# ディーラーの引いた2枚目のカードはダイヤの2でした。
# ディーラーの現在の得点は12です。
# ディーラーの引いたカードはハートのKです。
# あなたの得点は20です。
# ディーラーの得点は22です。
# あなたの勝ちです！
# ブラックジャックを終了します。

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{suit}の#{face}"
  end

  def face
    return value.to_s if (2..10).include?(value)
    return "A" if value == 1
    %w[J Q K][value - 11]
  end

  def point
    return 11 if value == 1
    return 10 if (11..13).include?(value)
    value
  end
end

class Deck
  def initialize
    @cards = []
    ["ハート", "ダイヤ", "クラブ", "スペード"].each do |suit|
    (1..13).each { |value| @cards << Card.new(value, suit) }
    end
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def total_points
    sum = cards.inject(0) { |acc, card| acc + card.point }
    if cards.any? { |card| card.value == 1 } && sum <= 11
      sum + 10
    else
      sum
    end
  end

  def to_s
    cards.join(", ")
  end
end

class Player
  attr_reader :hand

  def initialize
    @hand = Hand.new
  end

  def hit(deck)
    hand.add_card(deck.draw)
  end
end

class Dealer < Player
  def face_up_cards
    [hand.cards[0]]
  end

  def face_down_cards
    hand.cards[1..-1]
  end
end

deck = Deck.new
player = Player.new
dealer = Dealer.new

player.hit(deck)
player.hit(deck)
dealer.hit(deck)
dealer.hit(deck)

puts "ブラックジャックを開始します。"
puts "あなたの引いたカードは#{player.hand.cards[0]}です。"
puts "あなたの引いたカードは#{player.hand.cards[1]}です。"
puts "ディーラーの引いたカードは#{dealer.face_up_cards[0]}です。"
puts "ディーラーの引いた2枚目のカードはわかりません。"

while player.hand.total_points <= 21
  puts "あなたの現在の得点は#{player.hand.total_points}です。カードを引きますか？（Y/N）"
  input = gets.chomp
  break if input.downcase == "n"
  player.hit(deck)
  puts "あなたの引いたカードは#{player.hand.cards.last}です。"
end

if player.hand.total_points > 21
  puts "あなたの得点は#{player.hand.total_points}です。あなたの負けです。"
  exit
end

puts "ディーラーの引いた2枚目のカードは#{dealer.face_down_cards[0]}でした。"

while dealer.hand.total_points < 17
dealer.hit(deck)
puts "ディーラーの引いたカードは#{dealer.hand.cards.last}です。"
end

puts "あなたの得点は#{player.hand.total_points}です。"
puts "ディーラーの得点は#{dealer.hand.total_points}です。"

if dealer.hand.total_points > 21 || player.hand.total_points > dealer.hand.total_points
puts "あなたの勝ちです！"
elsif player.hand.total_points == dealer.hand.total_points
puts "引き分けです。"
else
puts "ディーラーの勝ちです。"
end

puts "ブラックジャックを終了します。"