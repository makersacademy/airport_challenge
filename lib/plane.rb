class Plane
  attr_reader :location
  def initialize
    @location = "up in the air"
  end

  def update_location_after_landing(airport_id)
    @location = airport_id
  end

  def report_landed
    "'This is plane #{self.object_id} speaking. We report that we landed at airport #{@location}'"
  end

  def update_location_after_take_off
    @location = "up in the air"
  end

  def report_take_off
    
  end

  def flying?
    @location == "up in the air"
  end

end
