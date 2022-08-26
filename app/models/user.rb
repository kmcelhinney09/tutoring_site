class User < ApplicationRecord
  has_secure_password
  enum role: [:tutee, :tutor, :teacher, :admin]
  after_initialize do
    if self.new_record?
      self.role ||= :tutee
    end
  end

  #password validation was adapted from chowderhead on dev.to at https://dev.to/nodefiend/rails-password-validation-29kj
  validate :password_lower_case
  validate :password_uppercase
  validate :password_special_char
  validate :password_contains_number

  def password_uppercase
    return if !!password.match(/\p{Upper}/)
    errors.add :password, ' must contain at least 1 uppercase '
  end

  def password_lower_case
    return if !!password.match(/\p{Lower}/)
    errors.add :password, ' must contain at least 1 lowercase '
  end

  def password_special_char
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if password =~ regex
    errors.add :password, ' must contain special character'
  end

  def password_contains_number
    return if password.count("0-9") > 0
    errors.add :password, ' must contain at least one number'
  end
end
