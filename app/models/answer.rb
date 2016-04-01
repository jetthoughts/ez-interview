class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :interview

  validates :question_id, :interview_id, :mark, presence: true

end
