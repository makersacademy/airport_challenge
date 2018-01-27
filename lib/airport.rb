# frozen_string_literal: true

# top-level class comment thing
class Airport
  attr_reader :airport_hangar

  def initialize
    @airport_hangar = []
  end

  def landing(plane)
    @airport_hangar << plane
  end

  def take_off(plane)
    @airport_hangar.delete(plane)
    "#{plane} has taken off!"
  end
end
