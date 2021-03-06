class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :activated, :admin, inclusion: { in: [true, false] }

  after_initialize :ensure_session_token
  after_initialize :ensure_activation
  after_initialize :ensure_admin

  after_create do
    self.activation_token = SecureRandom.urlsafe_base64
    save!
  end

  has_many :notes, foreign_key: :author_id

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user

    user.is_password?(password) ? user : nil
  end

  def password_digest
    hash = super
    return nil unless hash

    BCrypt::Password.new(hash)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_digest.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save!
    session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def ensure_activation
    self.activated ||= false
  end

  def ensure_admin
    self.admin ||= false
  end
end
