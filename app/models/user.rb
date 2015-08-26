class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :name, :surname

  after_save :send_welcome_email, 
    if: Proc.new { |u| u.confirmed_at_changed? && u.confirmed_at_was.nil? }

  def send_welcome_email
    UserMailer.welcome_letter(email, name, surname).deliver_now
  end

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
