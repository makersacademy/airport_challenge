
class Passenger

  attr_reader :name, :passport_number, :permission
  def initialize (name, passport_number)
    @name = name
    @passport_number = passport_number
    @permission = false
  end

  def travelling
    @permission = true
  end

  def not_travelling
    @permission = false
  end
end
