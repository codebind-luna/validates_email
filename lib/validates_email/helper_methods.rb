module ActiveModel
  module Validations
    module HelperMethods
      def validates_zipcode(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end
