class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.string :title
      t.integer :difficulty, default: 0
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
