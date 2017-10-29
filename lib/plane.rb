require './lib/whether'

class Plane
  attr_reader :status

  def initialize(status = 'grounded')
    @status = status
  end

  def land(airport)
    raise 'the plane cannot land due to the storm' if stormy?
    @status = 'grounded'
  end

  def takeoff
    raise 'the plane is grounded by the storm' if stormy?
    @status = 'airbourne'
  end

  def stormy?
    whether
    @new_whether.there_a_storm?
  end

  def whether
    @new_whether = Whether.new
  end
end
