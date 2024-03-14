# require 'faker'
# require 'csv'

# # 生成作者数据
# authors = []
# 50.times do
#   authors << {
#     name: Faker::Name.name,
#     nationality: Faker::Address.country,
#     birth_date: Faker::Date.birthday(min_age: 18, max_age: 90)
#   }
# end

# # 生成出版商数据
# publishers = []
# 20.times do
#   publishers << {
#     name: Faker::Company.name,
#     country: Faker::Address.country
#   }
# end

# # 生成流派数据
# genres = ['Romance', 'History', 'Fantasy', 'Science Fiction', 'Mystery', 'Horror', 'Thriller', 'Non-Fiction']

# # 生成书籍数据
# books = []
# 200.times do
#   books << {
#     title: Faker::Book.title,
#     author_id: authors.sample[:id],
#     publisher_id: publishers.sample[:id],
#     published_date: Faker::Date.backward(days: 365 * 50),
#     genre: genres.sample,
#     isbn: Faker::Code.isbn
#   }
# end

# # 导出为 CSV 文件
# CSV.open('books.csv', 'w', write_headers: true, headers: books.first.keys) do |csv|
#   books.each do |book|
#     csv << book.values
#   end
# end

# puts "CSV file generated: books.csv"
require 'faker'
require 'csv'

# 生成作者数据
authors = []
200.times do
  authors << {
    name: Faker::Name.name,
    nationality: Faker::Address.country,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 90)
  }
end

# 生成出版商数据
publishers = []
200.times do
  publishers << {
    name: Faker::Company.name,
    country: Faker::Address.country
  }
end

# 生成书籍数据
books = []
200.times do
  books << {
    title: Faker::Book.title,
    author: authors.sample[:name],
    publisher: publishers.sample[:name],
    published_date: Faker::Date.backward(days: 365 * 50),
    genre: Faker::Book.genre,
    isbn: Faker::Code.isbn
  }
end

# 导出为 CSV 文件
CSV.open('books.csv', 'w', write_headers: true, headers: ['Title', 'Author', 'Publisher', 'Published Date', 'Genre', 'ISBN', 'Author Name', 'Nationality', 'Birth Date', 'Publisher Name', 'Country']) do |csv|
  books.each do |book|
    author = authors.find { |a| a[:name] == book[:author] }
    publisher = publishers.find { |p| p[:name] == book[:publisher] }
    csv << [
      book[:title],
      book[:author],
      book[:publisher],
      book[:published_date],
      book[:genre],
      book[:isbn],
      author[:name],
      author[:nationality],
      author[:birth_date],
      publisher[:name],
      publisher[:country]
    ]
  end
end

puts "CSV file generated: books.csv"
