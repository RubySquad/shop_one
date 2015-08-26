class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :name, :surname
  after_find :after_find_action
  after_update  :after_save_action

  def after_find_action
    @confirmed = confirmed_at
  end

  def after_save_action
    if @confirmed == nil && confirmed_at != nil
      UserMailer.welcome_letter(email, name, surname).deliver_now
    end
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
