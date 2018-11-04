require_relative 'airport'

class Aeroplane

  DEFAULT_STATE = 'flying'

  attr_reader :status

  def initialize(state = DEFAULT_STATE)
    @status = state
  end

  def land(where = 'airport')
    @status = where
  end

  def takeoff
    @status = 'flying'
  end

  def airport
    @status != 'flying' ? @status : false
  end

  def flying
    @status == flying
  end

end
