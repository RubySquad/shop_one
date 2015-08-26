class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :name, :surname

  def role?(r)
    role.include? r.to_s
  end

  def admin?
    self.role == "admin"
  end

  def user?
    self.role == "user"
  end
end
