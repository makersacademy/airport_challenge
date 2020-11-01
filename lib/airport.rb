require_relative 'weather'

class Airport
  include Weather

  DEFAULT_CAPACITY = 50
  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY, planes = [])
    @capacity = capacity
    @planes = planes
  end
end