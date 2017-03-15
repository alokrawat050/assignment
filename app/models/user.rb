class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :zxcvbnable, :authentication_keys => [:login]
  
  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x
  
  validates_presence_of   :user_id, :message => 'Please enter user id.'
  validates_uniqueness_of :user_id, :message => 'User id already exixts.'
  validates_presence_of   :email, if: :email_required?, :message => 'Please enter email id.'
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?, :message => 'Email is already exixts.'
  validates_format_of     :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?
	validates_presence_of     :password, if: :password_required?, :message => 'Please enter password.', on: :create
	validates_length_of       :password, within: Devise.password_length, allow_blank: true, :message => 'Please enter password in between "8～15"character.', on: :create
	validates_format_of       :password, with: PASSWORD_FORMAT, on: :create
	validates_confirmation_of :password, if: :password_required?, :message => 'Please enter confirmation password.', on: :create

	validates_presence_of     :password, :message => 'Please enter new password.', on: :update
	validates_length_of       :password, within: Devise.password_length, allow_blank: true, :message => 'Please enter password in between "8～15"character.', on: :update
	validates_format_of       :password, with: PASSWORD_FORMAT, on: :update
	validates_confirmation_of :password, if: :password_required?, on: :update   

  validate :check_email
    
  def check_email
    unless email.blank?
      if email.present?
        unless email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
            errors.add(:email, "正くメールアドレスを入力してください。")
        else
            errors.add(:email, "メールドメイン名が正しくないように思われます。ご確認をお願いいたします。") unless validate_email_domain(email)
        end
      end
    end
  end
  
  def validate_email_domain(email)
    domain = email.match(/\@(.+)/)[1]
    Resolv::DNS.open do |dns|
      @mx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
    end
    @mx.size > 0 ? true : false
  end
         
  # Virtual attribute for authenticating by either user_id or email
  # This is in addition to a real persisted field like 'user_id'
  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.user_id || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["user_id = :value OR email = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
  
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
  
  protected

  # Checks whether a password is needed or not. For validations only.
  # Passwords are always required if it's a new record, or if the password
  # or confirmation are being set somewhere.
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end
end
