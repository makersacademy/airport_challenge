class Plane

  attr_accessor :state
  attr_accessor :weather

  def initialize(state='flying')
    @state = []
    @state.push(state)
  end

  def takeoff
    @state.pop
    @state.push('flying')
  end

  def land
    @state.pop
    @state.push('landed')
  end


end
