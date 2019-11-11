class Plane
  attr_reader :id

  def initialize(id)
    @in_air = false
    @id = id
  end

  def land
    raise "Plane #{@id} already landed" if @in_air == false
    @in_air = false
  end

  def takeoff
    raise "Plane #{@id} already in air" if @in_air == true
    @in_air = true
  end

  def in_air?
    @in_air
  end
end
