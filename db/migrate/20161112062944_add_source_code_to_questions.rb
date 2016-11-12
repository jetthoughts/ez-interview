class AddSourceCodeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :source_code, :text
  end
end
