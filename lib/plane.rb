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





end
