class Product < ActiveRecord::Base
  has_many :images

  validates :title, presence: true, uniqueness: true
end
