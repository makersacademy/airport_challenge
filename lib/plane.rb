class Plane
  attr_reader :status

  def initialize
    @status = :flying
  end

  def land
    raise 'A landed plane cannot land' if status == :landed
    @status = :landed
  end

  def take_off
    raise 'A flying plane cannot take off' if status == :flying
    @status = :flying
  end
end
