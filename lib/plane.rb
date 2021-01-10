require_relative 'airport'

class Plane

  def initialize
    @status = "In the air"
  end

  attr_reader :status

  def landed
    @status = "In airport"
  end

  def departed
    @status = "In the air"
  end
end
