class Question < ActiveRecord::Base
  DIFFICULTIES = { low: 0, medium: 1, high: 2 }
  enum difficulty: DIFFICULTIES

  belongs_to :category

  validates :body, presence: true
  validates :difficulty, presence: true
end
