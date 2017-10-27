require "validates_email/version"
require "validates_email/railtie" if defined?(Rails)
require "validates_email/regex"
require "validates_email/validator"
require "validates_email/helper_methods"
require "validates_email/email"

module ValidatesEmail
  def self.valid?(email)
    ValidatesEmail::Email.new(email: email).valid?
  end
end



