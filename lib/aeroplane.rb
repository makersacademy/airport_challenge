require_relative 'airport'

class Aeroplane

  DEFAULT_STATE = 'flying'

  def initialize(state = DEFAULT_STATE)
    @status = state
  end

  def land(where)
    @status = where
  end

  def takeoff
    @status = 'flying'
  end

  def airport
    @status != 'flying' ? @status : false
  end

  def flying
    @status == 'flying'
  end

end
