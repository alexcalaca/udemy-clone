class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  has_many :courses

  def to_s
    email
  end

  def username
    self.email.split(/@/).first
  end
end
