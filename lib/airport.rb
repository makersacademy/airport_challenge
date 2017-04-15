require_relative './safety'

class Airport
  include Safety
  attr_reader :name, :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def landing_confirm(plane)

  end

  def take_off_confirmation(plane)

  end

end
