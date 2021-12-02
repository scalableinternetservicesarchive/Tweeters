class Comment < ApplicationRecord
    self.per_page = 10
    belongs_to :user, optional: true
    belongs_to :tweet, optional: true
end

WillPaginate.per_page = 10
