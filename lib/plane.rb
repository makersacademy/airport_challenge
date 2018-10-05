$planes_outside_airports = []

class Plane

  def initialize
    $planes_outside_airports << self.object_id
  end

end
