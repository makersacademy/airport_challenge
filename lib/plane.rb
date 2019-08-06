require_relative 'airport'

class Plane
  attr_reader :departed
  def initialize
    @departed = false
  end

  def departed
    @departed = true
  end
end
