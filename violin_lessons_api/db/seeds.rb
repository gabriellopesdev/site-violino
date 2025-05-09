puts "Apagando usuários existentes..."
User.destroy_all

puts "Criando usuários..."

User.create!(
  name: "João da Silva",
  email: "joao@example.com",
  password: "Violin0@123",
  password_confirmation: "Violin0@123",
  role: 0
)


puts "Usuários criados com sucesso!"
