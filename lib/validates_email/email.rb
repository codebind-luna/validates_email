module ValidatesEmail
  class Email
    def initialize(args = {})
      @email        = args.fetch(:email)
    end

    def valid?
      return false if @email.nil? or @email.empty?
      !!(regexp =~ @zipcode)
    end

    alias_method :validate, :valid?

    private

    def regexp
      ValidatesEmail::EMAIL_REGEX
    end
  end
end