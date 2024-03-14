# # db/seeds.rb
# require 'csv'
# # 创建作者
# 10.times do
#   Author.create(
#     name: Faker::Book.author,
#     nationality: Faker::Address.country
#   )
# end

# # 创建出版商
# 5.times do
#   Publisher.create(name: Faker::Book.publisher)
# end

# # 创建流派
# genres = %w[Romance History Fantasy Science-Fiction Mystery Thriller]

# genres.each do |genre_name|
#   Genre.create(name: genre_name)
# end

# # 创建书籍
# 30.times do
#   book = Book.new(
#     title: Faker::Book.title,
#     published_at: Faker::Date.between(from: 50.years.ago, to: Date.today),
#     publisher_id: Publisher.first.id
#   )
#   book.author = Author.all.sample
#   book.genres << Genre.all.sample(rand(1..3))
#   book.save
# end


# # 读取 CSV 文件并导入数据
# # CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
# #   author = Author.find_or_create_by(name: row['author'])
# #   publisher = Publisher.find_or_create_by(name: row['publisher'])
# #   Book.create(
# #     title: row['title'],
# #     author: author,
# #     publisher: publisher,
# #     published_at: row['published_date'],
# #     genre: row['genre'],
# #     isbn: row['isbn']
# #   )
# # end
# CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
#   author = Author.find_or_create_by(name: row['Author Name'])
#   publisher = Publisher.find_or_create_by(name: row['Publisher Name'])
#   Book.create(
#     title: row['Title'],
#     author: author,
#     publisher: publisher,
#     published_at: row['Published Date'],
#     genre: row['Genre'],
#     isbn: row['ISBN']
#   )
# end
require 'csv'

# 创建作者
200.times do
  Author.create(
    name: Faker::Name.name,
    nationality: Faker::Address.country,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 90)
  )
end

# 创建出版商
200.times do
  Publisher.create(
    name: Faker::Company.name,
    country: Faker::Address.country
  )
end

# 创建流派
genres = ['Folklore', 'Mystery', 'Thriller', 'Romance', 'Science Fiction', 'Fantasy', 'Historical Fiction', 'Non-Fiction']

genres.each do |genre_name|
  Genre.create(name: genre_name)
end

# 读取 CSV 文件并导入数据
CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
  author = Author.find_or_create_by(name: row['Author Name'], nationality: row['Nationality'], birth_date: row['Birth Date'])
  publisher = Publisher.find_or_create_by(name: row['Publisher Name'], country: row['Country'])
  Book.create(
    title: row['Title'],
    author: author,
    publisher: publisher,
    published_at: row['Published Date'],
    genre: row['Genre'],
    isbn: row['ISBN']
  )
end
