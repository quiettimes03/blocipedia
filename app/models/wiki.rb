class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :users, dependent: :destroy

  after_initialize :initialize_role

  private

  def initialize_role
    self.private ||= false
  end
end
