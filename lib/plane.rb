require "./lib/airport.rb"

class Plane

  attr_accessor :status
  attr_reader :planes

  def initialize
    @status = status
  end

  def status_arrived
    self.status = "arrived"
  end

  def status_departed
    self.status = "departed"
  end

  def landed?(airport)
    airport.planes.include?(self) ? true : false
  end

end
