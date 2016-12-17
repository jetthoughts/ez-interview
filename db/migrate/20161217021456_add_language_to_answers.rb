class AddLanguageToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :language, :string
  end
end
