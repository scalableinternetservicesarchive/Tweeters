class Tweet < ApplicationRecord
    self.per_page = 10
    belongs_to :user, optional: true
    #has_many :comments
end

WillPaginate.per_page = 10