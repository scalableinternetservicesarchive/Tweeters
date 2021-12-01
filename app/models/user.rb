class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :tweets, foreign_key: :users_id
        has_many :followers
        has_many :profiles

  def self.search(first_name)
    if first_name
      first_name.downcase!
      where('LOWER(first_name) LIKE ?', "%#{first_name}%")
    else
      all
    end
  end
end

WillPaginate.per_page = 10
