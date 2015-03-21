require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5

  def full
    runway == capacity
  end

  def ok
    true
  end

  def runway
    @runway ||= []
  end
end
