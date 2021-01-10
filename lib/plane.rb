require_relative 'airport'

class Plane

  attr_reader :status

  def initialize
    @status = "In the air"
  end

  def landed
    @status = "In airport"
  end

  def departed
    @status = "In the air"
  end
end
