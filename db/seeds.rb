# Cria um usuário "Anônimo" se ele ainda não existir
unless User.find_by(email: 'anonimo@example.com')
    User.create!(
       email: 'anonimo@example.com',
       password: '4rhde584', # Certifique-se de que a senha esteja segura
       name: 'Anônimo'
    )
   end
   