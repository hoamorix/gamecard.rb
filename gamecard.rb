DESK_OF_CARDS = { Один Буби: 1, Два Черви: 2, Три Пики: 3, Четыре Крести: 4, Пять Джокер: 5 } #константа с колодой

puts 'Пожалуйста введите ваше имя и нажмите Enter что бы начать игру в пьяницу'
username = gets.chomp #ввод имени пользователя
puts "Привет #{username}, добро пожаловать в игру!"
users_desk = DESK_OF_CARDS.to_a.shuffle.to_h #превратить в массив, перетасовать и сделать снова хешем.
bots_desk = DESK_OF_CARDS.to_a.shuffle.to_h
user_score = 0
bot_score = 0

loop do
break if users_desk.size == 0 #луп крутится пока в колоде юзера есть карты

puts "Введите любое число от 0 до #{users_desk.size - 1}" if users_desk.size > 1 #Вводим число от 0 до индекса последнего элемента. #Если останется 1 карта, то сообщение скипаем.
users_input = users_desk.size > 1 ? gets.to_i : 0 #юзер вводит индекс карты пока их больше чем 1 в колоде
users_step = users_desk.to_a.delete_at(users_input) #снова делаем хеш массивом и удаляем из него элемент с индексом который ввёл юзер.
bots_step = bots_desk.to_a.delete_at(rand(0...(bots_desk.size))) #тоже самое для бота, только номер рандомный
users_desk.delete(users_step[0]) #удаляем из колоды карту, которую вытащили
bots_desk.delete(bots_step[0]) #тож самое для колоды бота
puts 'Последний ход!' if users_desk.size == 0
sleep (rand(1..2)) #бесполезно, чисто для эмуляции вычисления))
puts "Ваша карта #{users_step[0]} победила. У Компьютера #{bots_step[0]}" if users_step[1] > bots_step[1]
user_score += 1 if users_step[1] > bots_step[1] #увеличиваем счётчик на 1 если юзер вин
puts "Ваша карта #{users_step[0]} проиграла. У Компьютера #{bots_step[0]}" if users_step[1] < bots_step[1]
bot_score += 1 if users_step[1] < bots_step[1] #увеличиваем счётчик на 1 если бот вин
puts "Ого вот это удача #{users_step[0]}" if users_step[1] == bots_step[1]
sleep 1
puts user_score > bot_score ? "#{username} Вы победили," : "Компьютер проиграл вам,поздравляю вас #{username}" if users_desk.size == 0
end
