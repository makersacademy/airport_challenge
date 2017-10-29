require './lib/whether'

class Plane
  attr_reader :status


  def initialize(status = 'grounded')
    @status = status
  end

  def land(airport)
  end

  def takeoff
    if stormy?
      raise 'the plane is grounded by the storm'
    else
      @status = 'airbourne'
    end
  end

  def stormy?
    get_whether
    @new_whether.there_a_storm?
  end

  def get_whether
    @new_whether = Whether.new
  end

end
