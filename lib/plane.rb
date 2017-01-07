class Plane

  attr_reader :state

  def initialize
    @state = []
    @state.push('flying')
  end

  def land
    @state.pop
    @state.push('landed')
  end

  def takeoff
    @state.pop
    @state.push('flying')
  end




end
