require_relative './safety'

class Airport
  include Safety
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    planes = []
    @planes = planes
    @capacity = capacity
  end

  def landing_confirm(plane)

  end

  def take_off_confirmation(plane)

  end

end
