class Article < ApplicationRecord
  paginates_per 7
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length:           { minimum: 5 }
  
  belongs_to :category
  belongs_to :user

end
