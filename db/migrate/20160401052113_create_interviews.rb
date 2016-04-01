class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :name
      t.timestamp :appointed_at

      t.timestamps null: false
    end
  end
end
