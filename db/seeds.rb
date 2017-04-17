# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[Question, Avatar, Player].each(&:delete_all)

questions = (1..5).map do |i|
  answers = (1..4).map {|i| {text: "Answer #{i}", correct: false}}
  answers[0][:correct] = false
  { text: "Question number 1",
    answers: answers.to_json}
end

Question.create questions

player_names = ["Amy", "Bender", "Fry", "Hermes", "Zoidberg"]


avatars = player_names.map do |name|
  {img_url: "http://trivia:3000/#{name}.png",
   name: name}
end

Avatar.create avatars

players = Avatar.all.to_a.map do |avatar|
  name = avatar.name
  {name: name, email: "#{name.downcase}@futurama.org", avatar_id: avatar.id}
end

Player.create players

Rules.create name: "Default", questions_amount: 10, seconds_per_question: 30
