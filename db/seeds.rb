# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Criar os usuarios
User.destroy_all
User.create!([{
                   email: "campera@email.com",
                   password: "123456",
                   phone: "45999235361",
                   name: "Vinicios",
                   username: "Vinicios"
              },
              {
                  email: "joao@email.com",
                  password: "123456",
                  phone: "45999366606",
                  name: "Joao",
                  username: "Joao"
              },
              {
                  email: "marcio@email.com",
                  password: "123456",
                  phone: "45999106878",
                  name: "Marcio",
                  username: "Marcio"
              },
              {
                  email: "juliano@email.com",
                  password: "123456",
                  phone: "45999657024",
                  name: "Juliano",
                  username: "Juliano"
              }])

# Criar as linguas
Language.destroy_all
Language.create!([{
                     name: "Ingles"
                 },
                 {
                     name: "Portugues"
                 },
                 {
                     name: "Espanhol",
                 },
                 {
                     name: "Mandarin",
                 }])

# Criar as bibliotecas
Library.destroy_all
Library.create!([{
                   name: "Library of the Toledo",
                   user_id: 1
               },
               {
                   name: "Library of the Medianeira",
                   user_id: 2
               },
               {
                   name: "Library of the Curitiba",
                   user_id: 3
               },
               {
                   name: "Library of the Santa Helena",
                   user_id: 4
               }])

# Criar as estantes
Bookcase.destroy_all
Bookcase.create!([{
                     name: "Matematica",
                     library_id: 1,
                     user_id: 2
                 },
                 {
                     name: "Fisica",
                     library_id: 1,
                     user_id: 3
                 },
                 {
                      name: "Informatica",
                      library_id: 3,
                      user_id: 3
                 },
                {
                    name: "Portugues",
                    library_id: 4,
                    user_id: 4
                },
                 {
                      name: "Quimica",
                      library_id: 2,
                      user_id: 4
                 }])

#Criar os livros
Book.destroy_all
Book.create!([{
                      title: "Análise de séries temporais",
                      author: "Pedro A. Morettin",
                      numberPages: 564,
                      language_id: 2,
                      bookcase_id: 1
                  }])

#Criar as disciplinas
Discipline.destroy_all
Discipline.create!([{
                        name: "Calculo 1"
                    },
                    {
                        name: "Calculo 2"
                    },
                    {
                        name: "Algebra Relacional"
                    }])

#Criar reservas
Booking.destroy_all
Booking.create!([{
                     bookingStartDate: Time.now,
                     bnookigEndDate: Time.now + 86400 * 2,
                     user_id: 4,
                     book_id: 1
                 }])

#Criar emprestimos
Loan.destroy_all
Loan.create!([{
                     loanDate: Time.now,
                     returnDate: Time.now + 86400 * 2,
                     book_id: 1,
                     user_id: 4
                 }])

#Criar devoluções
Devolution.destroy_all
Devolution.create!([{
                  devolutionDate: Time.now,
                  loan_id: 1
                  }])