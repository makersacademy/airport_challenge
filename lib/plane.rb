require_relative 'airport'
class Plane
  attr_reader :plane
  $planes_landed = []

  def land(plane)
    $planes_landed << plane
  end

  def has_landed?(plane)
    false
  end
end
