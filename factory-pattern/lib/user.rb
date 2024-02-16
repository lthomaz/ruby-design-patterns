# frozen_string_literal: true

class UserBase
  def first_name = 'John'
  def last_name = 'Lennon'
end

class Admin < UserBase; end;
class Member < UserBase; end;
class Guest < UserBase; end;
