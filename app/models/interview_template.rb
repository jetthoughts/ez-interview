class InterviewTemplate < ActiveRecord::Base
  validates :name, presence: true

  has_many :interview_template_questions
end
