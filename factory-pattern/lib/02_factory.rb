# frozen_string_literal: true

require_relative 'user_factory'
require 'json'

class Endpoint
  def home(params)
    user = UserFactory.call(params[:user_type])
    full_name = [user.first_name, user.last_name].join(' ')
    { name: full_name }.to_json
  end

  def contact(params)
    user = UserFactory.call(params[:user_type])
    { first_name: user.first_name }.to_json
  end
end

puts Endpoint.new.home({ user_type: 'admin' })
