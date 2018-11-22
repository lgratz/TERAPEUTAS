Calendar.delete_all if Rails.env.development?
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



avatars = ["https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d34b70c76d7e81532a3f922ba31f3a5f&auto=format&fit=crop&w=500&q=80",
            "https://www.thecompassioncenter.com/wp-content/uploads/2016/09/Sal-Cialino-Yoga-Instructor-Staten-Island.jpg",
          "https://picsum.photos/300/300?image=1027",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWYK8OnlcXV4pKGlHaPFKrf4Op1MrF2dzJiWA92sloBrwffWTAhQ",
          "https://picsum.photos/300/300?image=832" ]



names = []
70.times do
  names << Faker::FunnyName.unique.two_word_name
end

names.each_with_index do |name, ind|
  f = User.new
  f.first = name.split(" ")[0]
  f.last = name.split(" ")[1]
  f.email = "#{name.split(" ")[0].downcase}@gmail.com"
  f.password = "123456"
  f.remote_avatar_url = avatars[(ind+1)%5]
  f.save
end





pat = User.new(
  { first: "Patricia",
    last: "Machado",
    email: "patricia@gmail.com",
    password: "123456",
    remote_avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ95FmmrmU5lfmHnODr7V_hfhBSJoo6xYVdL6DaBt2LDjPo798O"
   })
pat.save

pat = User.new(
  { first: "Rodrigo",
    last: "Brasileiro",
    email: "rodrigo@gmail.com",
    password: "123456",
    remote_avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSknxnZ7RvsD3MN4_U4pj-MajmiBQG2eDKDQgzZlKsr6FV78kNi"
   })
pat.save

pat = User.new(
  { first: "Antonio",
    last: "Gilberto",
    email: "antonio@gmail.com",
    password: "123456",
    remote_avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDojlUhP0VG2hI_5F7vu8xjEosAeZoNB22vJy7DoN34Z_5yWEp"
   })
pat.save

pat = User.new(
  { first: "Renato",
    last: "Silva",
    email: "renato@gmail.com",
    password: "123456",
    remote_avatar_url: "https://relayfm.s3.amazonaws.com/uploads/user/avatar/71/user_avatar_Davidsparks_artwork.png"
   })
pat.save






self_descriptions = [
  "Sou um professional qualificado trabalhando com a terapia massagem há 10 anos unindo tradições milenares às técnicas modernas e atuais com especial atenção nas músicas e utilizo estas técnicas para o enfrentamento do estresse e ansiedade",
  "Ofereço a você diversas opções de massagens: Relaxante, Alívio de dores, Terapêutica e Gestante",
  "Especializada em massagens faciais e corporais, Radiofrequência Fracionada, Microagulhamento, Kobido, Criolipólise, Limpeza de Pele, entre outras técnicas que fazem da clínica um espaço de referência no ramo da estética para encaixar com a necessidade do seu corpo, trazendo o melhor resultado.",
  "Trago para você o que há de melhor e mais saudável em terapias e tratamentos. Relaxantes e de combate ao stress podem ser vivenciadas individualmente ou também em casais, duplas e grupos."
]

photos = [
  "https://images.unsplash.com/photo-1537868393473-29e04e4d0c4b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=174eaf576dcc0a0f86d90fc959cb34a7&auto=format&fit=crop&w=1350&q=80",

]

ends = [
"R. São Carlos do Pinhal, 139 - Bela Vista, São Paulo - SP",
"R. Treze de Maio, 1947 - Bela Vista, São Paulo",
"R. do Paraíso, 432 - Paraíso, São Paulo",
"Av. Paulista, 149 - Bela Vista, São Paulo",
"Avenida Paulista, 1578, Bela Vista, São Paulo - SP",
"Avenida Paulista, 949, Bela Vista, São Paulo - SP",
"Avenida Paulista, 2355, Consolação, São Paulo - SP",
"Avenida Paulista, 1048, Bela Vista, São Paulo - SP",
"Avenida Paulista, 901, Bela Vista, São Paulo - SP",
"Avenida Paulista, 1605, Bela Vista, São Paulo - SP",
"Avenida Paulista, 37, Bela Vista, São Paulo - SP",
"Avenida Paulista, 2064, Consolação, São Paulo - SP",
"Avenida Paulista, 807, Bela Vista, São Paulo - SP",
"Avenida Paulista, 200, Bela Vista, São Paulo - SP",
"Avenida Paulista, 2240, Consolação, São Paulo - SP",
"Avenida Paulista, 392, Bela Vista, São Paulo - SP",
"Avenida Paulista, 1098, Bela Vista, São Paulo - SP",
"Avenida Paulista, 900, Bela Vista, São Paulo - SP",
"Av. Brigadeiro Luís Antônio, 2867 - Jardim Paulista, São Paulo - SP",
"Av Brigadeiro Luís Antônio, 3914, Jardim Paulista",
"Av Brigadeiro Luís Antônio, , Jardim Paulista",
"Av Brigadeiro Luís Antônio, 3724",
"Av Brigadeiro Luís Antônio, 3460, Jardim Paulista",
"Av Brigadeiro Luís Antônio, 3333",
"Av Brigadeiro Luís Antônio, 2482, Jardim Paulista",
"Av Brigadeiro Luís Antônio, 2344",
"Alameda Santos, 1054, Jardim Paulista",
"lameda Santos, 45, Paraíso, São Paulo",
"Alameda Santos, 1437, Jardim Paulista",
"Alameda Santos, 870, Jardim Paulista",
"Alameda Santos, 485, Paraíso",
"Alameda Santos, 764, Jardim Paulista",
"Alameda Santos, 86, Paraíso",
"Alameda Jaú, 1303",
"Alameda Jaú, 369",
"Alameda Jaú, 1754",
"R. Maria Figueiredo, 490 - Paraíso",
"R. Mario Amaral, 50 - Paraíso, São Paulo",
"R. Teixeira da Silva, 531 - Paraíso",
"R. Tutóia, 119 - Vila Mariana, São Paulo",
"Alameda Santos, 1054 - Cerqueira César",
"Alameda Joaquim Eugênio de Lima, 697",
"R. Dr. Fausto Ferraz, 163 - Bela Vista",
"Alameda Santos, 1105 - Cerqueira César",
"Av. Paulista, 1000 - Bela Vista",
"R. Mario Amaral, 50 - Paraíso",
"R. Dr. Rafael de Barros, 262 - Paraíso",
"R. Cubatão, 77, Paraíso",
"R. Treze de Maio, 1947 - Bela Vista",
"R. Martiniano de Carvalho, 965",
]


ends.each_with_index do |address, ind|
  l = Therapist.new
  l.address = address
  l.phone = "1122233344"
  l.session_price = rand(60..180)
  l.self_description = self_descriptions[ (ind + 1)%4]
  l.remote_photos_url = photos[0] if ind == 0
  l.user_id = User.all[ind].id
  l.save
end


Therapist.all.each do |therapist|
  Category.all.sample(rand(1..6)).each do |category|
    service = Service.new(therapist: therapist, category: category)
    service.save
  end
end

Therapist.all.each do |therapist|

  [-1, 0 , 3].each do |day|
    (8..20).to_a.sample(8).each do |hour|
      o = Appointment.new
      o.session_date = "#{Date.today + day + 1} #{hour}:00:00".to_datetime
      o.user_id = User.all[rand(0..45)].id
      o.therapist_id = therapist.id
      o.category_selected = therapist.services.sample(1).first.category.name
      o.price = therapist.session_price
      if day == -1
        o.status = "Finalizado"
        o.rating = rand(3..5)
      elsif day == 0
        o.status = "Qual o rating?"
      else
        o.status = "Agendado"
      end
      o.save
    end
  end

end

puts "Seeds created yay!"
