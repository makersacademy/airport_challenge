require_relative 'airport'

class Plane
  attr_reader :status

  def arrived
    @status = :arrived
  end

  def departed
    @status = :departed
  end
end