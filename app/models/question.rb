class Question < ActiveRecord::Base
  enum difficulty: { low: 0, medium: 1, high: 2 }

  belongs_to :category

  validates :body, presence: true
  validates :difficulty, presence: true
end
