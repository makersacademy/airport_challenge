class Airport

  def initialize
    @tarmac = []
  end

  def land(airplane)
    @tarmac.push(airplane)
  end

  def takeoff(airplane)
    @tarmac.delete(airplane)
  end

  def on_tarmac
    @tarmac
  end


  attr_reader :tarmac
  attr_writer :tarmac


end
