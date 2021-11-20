DESK_OF_CARDS = {
        Одна бубя: 1,
        Два Черви: 2,
        Три Пики: 3,
        Четыре Крести: 4,
        Пять Джокер: 5
}

puts 'Пожалуйста введите ваше имя и нажмите Enter что бы начать игру в пьяницу'
username = gets.chomp

puts "Привет #{username}, добро пожаловать в игру!"

user_desk = DESK_OF_CARDS.to_a.shuffle.to_h
bot_desk = DESK_OF_CARDS.to_a.shuffle.to_h
user_score = 0
bot_score = 0

loop do
        break
                if user_desk.size == 0

puts "Введите любое число от 0 до #{user_desk.size - 1}"
if user_desk.size > 1

user_input = user_desk.size > 1 ? gets.to_i : 0
user_step = user_desk.to_a.delete_at(user_input)
bot_step = bot_desk.to_a.delete_at(rand(0...(bot_desk.size)))

user_desk.delete(user_step[0])
bot_desk.delete(bot_step[0])

puts 'Последний ход!'
if user_desk.size == 0
sleep(rand(1. .2))
puts "Ваша карта #{user_step[0]} победила. У Компьютера #{bot_step[0]}"
if user_step[1] > bot_step[1]

user_score += 1
if user_step[1] > bot_step[1]

puts "Ваша карта #{user_step[0]} проиграла. У Компьютера #{bot_step[0]}"
if user_step[1] < bot_step[1]

bot_score += 1
if user_step[1] < bot_step[1]

puts "Ого вот это удача #{user_step[0]}"
if user_step[1] == bot_step[1]
sleep 1
puts user_score > bot_score ? "#{username} Вы победили" : "Компьютер проиграл"
if user_desk.size == 0
end
