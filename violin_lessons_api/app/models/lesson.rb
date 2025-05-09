class Lesson < ApplicationRecord
  has_many :materials
  has_many :progresses

  validates :title, presence: true
end
