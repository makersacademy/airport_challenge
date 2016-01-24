require_relative 'airport'

class Plane
  attr_reader :status

  def arrive
    @status = :arrive
  end

  def depart
    @status = :depart
  end
end