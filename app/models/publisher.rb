class Publisher < ApplicationRecord
  has_many :books

  validates :name, presence: true
  validates :country, presence: true
end
