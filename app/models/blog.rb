class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :blogimage
end
