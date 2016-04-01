class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
