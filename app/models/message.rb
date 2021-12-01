class Message < ApplicationRecord
  self.per_page = 10
end

WillPaginate.per_page = 10
