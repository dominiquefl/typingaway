class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, presence: true, length: {minimum: 5}


  def tag_list 
    tags.join(", ")
  end
end

