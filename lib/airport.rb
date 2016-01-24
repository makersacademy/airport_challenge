require_relative 'plane'

class Airport

attr_reader :holding_bay, :weather

  def initialize
    @holding_bay = []
  end

  def land(plane)
    if sunny?
      plane.change_status
      @holding_bay << plane
    else
      "Unsafe to land plane whilst stormy"
    end
  end

  def take_off
    if sunny?
      plane = @holding_bay.pop
      plane.change_status
      plane
    else
      "Unsafe to take off plane whilst stormy"
    end
  end


  def sunny?
    rand*100 > 10 ? true : false
  end

#   def setup_holding_bay(capacity)
#     @holding_bay =
#   end

end
