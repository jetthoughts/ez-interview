class Interview < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  validates :name, :appointed_at, presence: true

  def questions_count_by_difficulty
    counts = questions.group(:difficulty).count

    Question.difficulties.map do |name, value|
      [name, counts[value] || 0]
    end
  end

  def total_score
    total = answers.sum(:mark)
    if total > 0
      total/answers.count
    else
      'No score yet'
    end
  end
end
