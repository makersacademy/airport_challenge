class Plane
  attr_reader :in_airport_status

  def initialize
    @in_airport_status = nil
  end

  def take_off
    @in_airport_status = false
  end

  def land
    @in_airport_status = true
  end

  private

  def landed?
    in_airport_status
  end

  def in_airport?
    in_airport_status
  end
end
