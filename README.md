# Tamai

**「体操の技みたいに」自分の名前で作る**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tamai'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tamai

## Usage

```
Tamai.station(1500002)
# => 最寄駅: 東急東横線 渋谷 （しぶや）駅
隣駅: 代官山
ここから約393m
Tamai.station(1500001)
# => 最寄駅: 東京メトロ千代田線 明治神宮前 （めいじじんぐうまえ）駅
隣駅: 表参道、代々木公園
ここから約316m
```
