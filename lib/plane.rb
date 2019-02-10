require 'airport'

class Plane

  attr_accessor :status, :location

  def initialize
    @status = "Airbourne."
    #@location = ""
  end

  def land(where_to_land)
    @location = where_to_land
    @location.hangar << self
    @status = "Landed."

  end

  def take_off
    @status = "Airbourne."
    (@location.hangar).pop
  end






end
