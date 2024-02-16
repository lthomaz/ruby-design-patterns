# frozen_string_literal: true

require_relative 'user'

class UserFactory
  class << self
    def call(user_type)
      if user_type == 'admin'
        Admin.new
      elsif user_type == 'member'
        Member.new
      else
        Guest.new
      end
    end
  end
end
