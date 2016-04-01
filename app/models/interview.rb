class Interview < ActiveRecord::Base
  has_many :answers

  validates :name, :appointed_at, presence: true
end
