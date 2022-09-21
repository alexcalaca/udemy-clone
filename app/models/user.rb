class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  has_many :courses
  after_create :assign_default_role


  def to_s
    email
  end

  def username
    self.email.split(/@/).first
  end  

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end
end
