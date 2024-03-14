class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true
  validates :birth_date, presence: true
end
