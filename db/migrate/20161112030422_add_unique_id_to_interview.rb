class AddUniqueIdToInterview < ActiveRecord::Migration
  def change
    add_column :interviews, :unique_id, :string, null: false, index: true
  end
end
