class CreateInterviewTemplateQuestions < ActiveRecord::Migration
  def change
    create_table :interview_template_questions do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true
      t.integer :difficulty

      t.timestamps null: false
    end
  end
end
