require 'airport.rb'
class Plane
  def initialize
    $plane_status = true
  end

  def flying?
    return $plane_status
  end
end
