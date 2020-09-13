class Review < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :content, presence:true, length: { in: 20..500 }
  validates :rating, presence:true, numericality: { only_integer: true }, inclusion: { in: [1, 2, 3, 4, 5] }
end
