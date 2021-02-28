class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, presence: true, length: {minimum: 5}


  def tag_list 
    tags.join(", ")
  end

  def tag_list=(tag_string)
    tag_names = tag_string.split(",").map{|t| t.strip.downcase }.uniq
    new_or_found_tags = tag_names.map{|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end
end

