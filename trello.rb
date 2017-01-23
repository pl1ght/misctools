require 'trello'

dev_key = '3018d092aac2c2df60b4d58b8a862aab'
member_key = '5caf135de6ff99c5fe35ede4227d1d95393b42adccbfa01608f68340ab3d2822'

# Configure Trello client connection
Trello.configure do |config|
  config.developer_public_key = dev_key
  config.member_token = member_key
end

me = Trello::Member.find('davewithers3')

board = me.boards[3]
puts board.name

board.cards.each do |card|
  puts "- \"#{card.name}\""
end

board.lists.each do |list|
  puts "- \"#{list.name}\""
end