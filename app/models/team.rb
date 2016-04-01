class Team < ActiveRecord::Base
  has_many :team_memberships
  has_many :users, through: :team_memberships

  validates :name, presence: true


  def create_owner(user)
    TeamMembership.create(team: self, user: user).owner!
  end

  def invite_member(user)
    self.team_memberships.create(user: user).pending!
  end

  def confirm_member(user)
    team_memberships.find_by(user: user).confirmed!
  end

end
