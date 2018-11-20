require 'faker'

Appointment.delete_all if Rails.env.development?
Service.delete_all if Rails.env.development?
Therapist.delete_all if Rails.env.development?
User.delete_all if Rails.env.development?
Category.delete_all if Rails.env.development?

puts "Creating seed!"

c = Category.new
c.name = "Massagem Antiestresse"
c.description = "Se você é uma pessoa muito estressada no cotidiano e está sempre sob pressão, esse é um dos tipos de massagem que você precisa.
Com deslizamento e amassamento, essa massagem estimula a liberação da ocitocina e ainda outros hormônios de antiestresse. É uma massagem mais leve para evitar que você tenha dores em seu corpo."
c.image = "https://images.unsplash.com/photo-1519823551278-64ac92734fb1?ixlib=rb-0.3.5&s=effca5cff8df9610ba97ca4fdf6f0220&auto=format&fit=crop&w=634&q=80"
c.save

d = Category.new
d.name = "Shiatsu"
d.description = "Um dos tipos de massagens mais conhecidas, disciplina oriental que combina a pressão dos polegares, palmas das mãos e cotovelos em canais que fluem a energia. Certamente, você precisa experimentar."
d.image = "https://images.unsplash.com/photo-1519824145371-296894a0daa9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8d6d77a200077530beff1d2b4f600be7&auto=format&fit=crop&w=1350&q=80"
d.save

e = Category.new
e.name = "Reiki"
e.description = "Técnica comprovada para aliviar muitas dores, com imposição de mãos e transmissão de energia em lugares específicos do seu corpo, que melhora os aspectos físicos, emocionais e espirituais. Além disso, ajuda positivamente em qualquer tratamento médico."
e.image = "https://images.unsplash.com/photo-1447619297994-b829cc1ab44a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=86ebe4525a7c1d7cfa55148b18741dc5&auto=format&fit=crop&w=1335&q=80"
e.save

s = Category.new
s.name = "Reflexologia"
s.description = "A Reflexologia faz pressões nas mãos ou nos pés e equilibra a energia do seu corpo. Cada ponto do seu pé tem um órgão correspondente"
s.image = "https://images.unsplash.com/photo-1537128535997-13b690849da9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d26f3521d8ebee0de20f9fb637f5b5ad&auto=format&fit=crop&w=1350&q=80"
s.save

r = Category.new
r.name = "Yoga"
r.description = "Yoga é um forma de levar a vida e se pararmos para pensar, temos praticado desde que somos bebês! Por exemplo fazendo o alongamento do gato, para alongar a coluna. Você sempre vê as crianças fazendo algum tipo de yoga durante o dia.
O yoga funciona para todos: pessoas que trabalham em um escritório, praticantes de esportes, pessoas procurando perder peso, com uma rotina intensa ou tranquila no dia-a-dia que podem ter mais qualidade de vida com a prática."
r.image = "https://images.unsplash.com/photo-1447619297994-b829cc1ab44a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=86ebe4525a7c1d7cfa55148b18741dc5&auto=format&fit=crop&w=1335&q=80"
r.save

h = Category.new
h.name = "Acupuntura"
h.description = "A acupuntura é uma terapia milenar originária da China, que consiste na aplicação de agulhas em pontos específicos do corpo para tratar doenças e para promover saúde. Estas agulhas, quando aplicadas sobre algumas regiões específicas são capazes de tratar diversas doenças físicas ou emocionais como sinusite, asma, enxaqueca ou artrite por exemplo, além de melhorar o sistema imunitário."
h.image = "https://images.unsplash.com/photo-1512290746430-3ffb4fab31bc?ixlib=rb-0.3.5&s=76f82990ff0b59c3585c8593cbee8086&auto=format&fit=crop&w=1350&q=80"
h.save



inputs = {roberto: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d34b70c76d7e81532a3f922ba31f3a5f&auto=format&fit=crop&w=500&q=80", anderson: "https://www.thecompassioncenter.com/wp-content/uploads/2016/09/Sal-Cialino-Yoga-Instructor-Staten-Island.jpg", tabata: "https://picsum.photos/300/300?image=1027",
  davisjr: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWYK8OnlcXV4pKGlHaPFKrf4Op1MrF2dzJiWA92sloBrwffWTAhQ", camila: "https://picsum.photos/300/300?image=832" }
inputs.each do |key, value|
  f = User.new
  f.first = key
  f.last = Faker::Artist.name
  f.email = "#{key}@gmail.com"
  f.password = key
  f.remote_avatar_url = value
  f.save
end


l = Therapist.new
l.address = "R. Artur de Azevedo, 1339"
l.phone = "1122233344"
l.session_price = 100
l.self_description = "Trago para você o que há de melhor e mais saudável em terapias e tratamentos. Relaxantes e de combate ao stress podem ser vivenciados individualmente ou também em casais, duplas e grupos."
l.photos = "https://images.unsplash.com/photo-1534152202999-c6339e8a43d7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b4775a64f61c6da1aee20624c3d11454&auto=format&fit=crop&w=1350&q=80"
l.user_id = User.all[0].id
l.save

a = Therapist.new
a.address = "Av. Marquês de São Vicente, 2219"
a.phone = "117778889990"
a.session_price = 120
a.self_description = "Estou uma professional qualificada trabalhando com a terapia massagem há 10 anos unindo tradições milenares às técnicas modernas e atuais com especial atenção nas músicas e utilizo estas técnicas para o enfrentamento do estresse e ansiedade"
a.photos = "https://images.unsplash.com/photo-1537868393473-29e04e4d0c4b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=174eaf576dcc0a0f86d90fc959cb34a7&auto=format&fit=crop&w=1350&q=80"
a.user_id = User.all[2].id
a.save

a = Therapist.new
a.address = "Rua Mourato Coelho, 861"
a.phone = "11772221111"
a.session_price = 80
a.self_description = "Ofereço á você diversas opções de massagens: Relaxante, Alívio de dores, Terapêutica e Gestante"
a.photos = "https://images.unsplash.com/photo-1537868393473-29e04e4d0c4b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=174eaf576dcc0a0f86d90fc959cb34a7&auto=format&fit=crop&w=1350&q=80"
a.user_id = User.all[3].id
a.save

b = Therapist.new
b.address = "Av. Marquês de São Vicente, 576"
b.phone = "1198719"
b.session_price = 120
b.self_description = "Especializada em massagens faciais e corporais, Radiofrequência Fracionada, Microagulhamento, Kobido, Criolipólise, Limpeza de Pele, entre outras técnicas que fazem da clínica um espaço de referência no ramo da estéticaaixar com a necessidade do seu corpo, trazendo o melhor resultado."
b.photos = "https://images.unsplash.com/photo-1519823551278-64ac92734fb1?ixlib=rb-0.3.5&s=effca5cff8df9610ba97ca4fdf6f0220&auto=format&fit=crop&w=634&q=80"
b.user_id = User.all[4].id
b.save

Therapist.all.each do |therapist|
  Category.all.sample(rand(0..5)).each do |category|
    service = Service.new(therapist: therapist, category: category)
    service.save
  end
end


[-1, 0 , 1].flatten.each do |day|
  (8..20).to_a.sample(6).each do |hour|
    o = Appointment.new
    o.session_date = "#{Date.today + day} #{hour}:00:00".to_datetime
    o.user_id = User.all[1].id
    o.therapist_id = Therapist.all[1].id
    o.category_selected = Therapist.all[1].services.sample(1).first.category.name
    o.price = Therapist.all[1].session_price
    if day == -1
      o.status = "Finalizado"
      o.rating = rand(3..5)
    elsif day == 0
      o.status = "Aguardando rating"
    else
      o.status = "Agendado"
    end
    o.save
  end
end


puts "Seeds created yay!"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
