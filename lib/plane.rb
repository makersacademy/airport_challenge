class Plane

  attr_reader :status

  def initialize
    @status
  end

  def land
    fail 'already landed' if @status == :landed
    @status = :landed
  end

  def take_off
    fail 'already taken off' if @status == :taken_off
    @status = :taken_off
  end
end
