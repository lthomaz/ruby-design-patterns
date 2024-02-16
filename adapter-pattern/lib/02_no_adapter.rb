# frozen_string_literal: true

require_relative './paypal_lib'
require_relative './braintree_lib'
require_relative './user'

class ClientApp
  def self.call(platform:, user:)
    if platform == :paypal
      PaypalLib.subscription(email: user.email)
      PaypalLib.customer(
        fname: user.first_name,
        lname: user.last_name
      )
    elsif platform == :braintree
      BraintreeLib.user(full_name: user.full_name)
      BraintreeLib.subscribe(external_id: user.id)
    else
      raise 'Wrong platform!'
    end
  end
end

ClientApp.call(platform: :braintree, user: User.new)
# ClientApp.call(platform: :paypal, user: User.new)
