require_relative 'passenger'
require_relative 'container'

class Airport
  include Container
  attr_accessor :planes
  attr_accessor :plane_capacity


  def planes
    message = "Plane can't land! Airport is full"
    fail message if @planes >= (@plane_capacity ||= 15)
    @planes ||= 0
  end

end

