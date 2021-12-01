class Comment < ApplicationRecord
    self.per_page = 10
end

WillPaginate.per_page = 10
