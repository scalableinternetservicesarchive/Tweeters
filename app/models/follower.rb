class Follower < ApplicationRecord
  belongs_to :user, optional: true
end
