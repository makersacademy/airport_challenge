require_relative 'airport'

class Plane
  attr_reader :status

  def arrive
    @status = :arrived
  end

  def depart
    @status = :departed
  end
end