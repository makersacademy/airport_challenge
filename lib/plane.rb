class Plane

  attr_reader :status

  def initialize
    @status = :untracked
  end

  def flight(state)
    @status = state
  end

  def in_the_air?
    @status == :taken_off
  end

end
