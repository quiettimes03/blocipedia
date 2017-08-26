class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :users, dependent: :destroy
end
