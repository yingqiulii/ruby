class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_and_belongs_to_many :genres

  validates :title, presence: true
  validates :published_at, presence: true
  validates :isbn, presence: true
end
# class Book < ApplicationRecord
#   belongs_to :author
#   belongs_to :publisher
#   has_and_belongs_to_many :genres

#   validates :title, presence: true
#   validates :published_at, presence: true
#   validates :isbn, presence: true

#   before_validation :set_default_genre

#   private

#   def set_default_genre
#     self.genre ||= nil
#   end
# end
