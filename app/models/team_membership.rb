class TeamMembership < ActiveRecord::Base
  # scheme
  # user_id
  # team_id
  # status
  STATUSES = ['pending', 'confirmed', 'owner']

  belongs_to :user
  belongs_to :team

  validates :user_id, :team_id, presence: true

  validates :status, inclusion: { in: STATUSES }

end
