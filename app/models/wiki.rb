class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :users, through: :collaborators, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  after_initialize :initialize_role

  private

  def initialize_role
    self.private ||= false
  end
end
