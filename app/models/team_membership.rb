class TeamMembership < ActiveRecord::Base
  # scheme
  # user_id
  # team_id
  # status
  enum status: [:pending, :confirmed, :owner]

  belongs_to :user
  belongs_to :team

  validates :user_id, :team_id, presence: true
end
