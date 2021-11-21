class Tweet < ApplicationRecord
    self.per_page = 10
    belongs_to :user, optional: true
end

WillPaginate.per_page = 10
