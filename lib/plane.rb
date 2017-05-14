require './lib/airport'

class Plane

  def landing_confirmation
    'Plane landed safely'
  end

  def takeoff_confirmation
    'Plane takeoff succesful'
  end

  def landing_problem
    'Unable to land at airport'
  end

  def takeoff_problem
    'Unable to takeoff from airport'
  end

end
