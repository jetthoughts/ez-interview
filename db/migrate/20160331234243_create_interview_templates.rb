class CreateInterviewTemplates < ActiveRecord::Migration
  def change
    create_table :interview_templates do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
