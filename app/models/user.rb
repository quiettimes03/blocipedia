class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy

  enum role: [:standard, :admin, :premium]

  after_initialize :default_role_standard

  private

  def default_role_standard
    self.role ||= :standard
  end
end
