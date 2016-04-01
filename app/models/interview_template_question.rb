class InterviewTemplateQuestion < ActiveRecord::Base
  enum difficulty: Question::DIFFICULTIES
  belongs_to :category

  belongs_to :question

  belongs_to :interview_template
end
