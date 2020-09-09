class Project < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications
  has_many :reviews, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  has_many :messages, through: :chatroom
  has_many :project_technologies, dependent: :destroy
  has_many :technologies, through: :project_technologies
  has_rich_text :rich_content
  has_one_attached :document
  validates :title, :description, :duration, :difficulty, presence: true
  validates :title, length: { in: 10..200 }
  validates :description, length: { in: 20..1500 }
  validates :duration,  numericality: { only_integer: true, greater_than: 0 }
  # Difficulty
  DIFFICULTIES = %w(beginner intermediate advanced)
  validates :difficulty, inclusion: { in: DIFFICULTIES }
  # PG Search
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [:title, :description],
  using: {
    tsearch: { prefix: true }
  }
end
