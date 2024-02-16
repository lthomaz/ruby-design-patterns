# frozen_string_literal: true

require_relative 'user'
require 'json'

class Endpoint
  def home(params)
    user = if params[:user_type] == 'admin'
             Admin.new
           elsif params[:user_type] == 'member'
             Member.new
           else
             Guest.new
           end

    full_name = [user.first_name, user.last_name].join(' ')
    { name: full_name }.to_json
  end

  def contact(params)
    if params[:user_type] == 'admin'
      Admin.new
    elsif params[:user_type] == 'member'
      Member.new
    else
      Guest.new
    end
  end
end

puts Endpoint.new.home({ user_type: 'admin' })
