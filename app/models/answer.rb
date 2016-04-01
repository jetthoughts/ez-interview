class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :interview

  validates :question_id, :interview_id, :mark, presence: true

  def mark_label_class
    if mark < 20
      'label-danger'
    elsif 20 < mark && mark < 40
      'label-warning'
    elsif 40 < mark && mark < 60
      'label-info'
    elsif 60 < mark && mark < 80
      'label-primary'
    elsif 80 < mark && mark < 100
      'label-success'
    end
  end
end
