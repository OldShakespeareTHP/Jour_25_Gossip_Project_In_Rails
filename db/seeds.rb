# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'database_cleaner-active_record'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

10.times do
  user_temp = User.all.sample
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Hipster.paragraph(sentence_count: 2), email: Faker::Internet.email, age: rand(14..70), city: City.all.sample)
end

20.times do
  Gossip.create(title: Faker::JapaneseMedia::SwordArtOnline.item, content: Faker::Books::Dune.quote, user: User.all.sample)
end


hashtag_list = ["#ico", "#ethereum", "#crypto", "#crowdfunding", "#medicaid", "#blackhistorymonth", "#womenshistorymonth", "#photography", "#iwd2019", "#cryptocurrency", "#happyeaster", "#womensday", "#pressforprogress", "#happybirthday", "#internationalwomensday", "#olympics", "#pets", "#friends", "#piday", "#worldwaterday", "#funny", "#contest", "#starwarsday", "#giveaway", "#tuesdaymotivation", "#mondaymotivation", "#traveltuesday", "#wcw", "#tbt"]
len_hashtag_ind_max = hashtag_list.count - 1

10.times do
  Tag.create(title: hashtag_list.sample)
end

(1..20).each do |ind|
  gossip_temp = Gossip.find_by(id: ind)
  nb_of_tags = rand(1..3)
  nb_of_tags.times do
    tag_temp = Tag.all.sample
    TagGossip.create(gossip: gossip_temp, tag: tag_temp)
  end
end

20.times do
  sender_id = rand(1..10)
  while((receiver_id = rand(1..10)) == sender_id)
    true
  end
  PrivateMessage.create(content: Faker::Movies::VForVendetta.speech, sender: User.find_by(id: sender_id), recipient: User.find_by(id: receiver_id))
end