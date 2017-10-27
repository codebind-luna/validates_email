require "spec_helper"

class TestUser < TestModel
  validates :email, :email => true
end

class StrictUser < TestModel
  validates :email, :email => {:strict_mode => true}
end

class TestUserAllowsNil < TestModel
  validates :email, :email => {:allow_nil => true}
end

class TestUserAllowsNilFalse < TestModel
  validates :email, :email => {:allow_nil => false}
end

class TestUserWithMessage < TestModel
  validates :email, :email => {:message => 'is not looking very good!'}
end

describe "validation" do
    context "given the valid emails" do
      [
        "a+b@plus-in-local.com",
        "a_b@underscore-in-local.com",
        "user@example.com",
        " user@example.com ",
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@letters-in-local.org",
        "01234567890@numbers-in-local.net",
        "a@single-character-in-local.org",
        "one-character-third-level@a.example.com",
        "single-character-in-sld@x.org",
        "local@dash-in-sld.com",
        "letters-in-sld@123.com",
        "one-letter-sld@x.org",
        "uncommon-tld@sld.museum",
        "uncommon-tld@sld.travel",
        "uncommon-tld@sld.mobi",
        "country-code-tld@sld.uk",
        "country-code-tld@sld.rw",
        "local@sld.newTLD",
        "local@sub.domains.com",
        "aaa@bbb.co.jp",
        "nigel.worthington@big.co.uk",
        "f@c.com",
        "areallylongnameaasdfasdfasdfasdf@asdfasdfasdfasdfasdf.ab.cd.ef.gh.co.ca",
        "ящик@яндекс.рф"
      ].each do |email|

        it "#{email.inspect} should be valid" do
          expect(TestUser.new(:email => email)).to be_valid
        end
      end
    end
end

