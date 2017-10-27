require 'active_model'
require 'active_model/validator'

module ValidatesEmail
  class Validator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless ValidatesEmail::Email.new(email: value)
        record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid_email', value: value, default: 'Email is invalid'))
      end
    end
  end
end

ActiveModel::Validations::EmailValidator = ValidatesEmail::Validator