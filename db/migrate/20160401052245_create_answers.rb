class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :interview, index: true, foreign_key: true
      t.text :text
      t.text :comment
      t.float :mark

      t.timestamps null: false
    end
  end
end
