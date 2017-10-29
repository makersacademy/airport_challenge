require './lib/whether'

class Plane
  attr_reader :status

  def initialize(status = 'grounded')
    @status = status
  end

  def land(airport, skies = stormy?)
    raise 'the plane cannot land due to the storm' if skies
    @status = 'grounded'
  end

  def takeoff(skies = stormy?)
    raise 'the plane is grounded by the storm' if skies
    @status = 'airbourne'
  end

  def stormy?
    @new_whether = Whether.new
    answer = @new_whether.there_a_storm?
    answer
  end

end
