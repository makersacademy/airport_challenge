class Plane

  attr_reader :status, :flight_number

  def initialize
    @status = 'airborne'
    @flight_number = number_gen
  end

  def landed
    @status = 'landed'
  end

  def takeoff
    @status = 'airborne'
  end

  def airborne?
    @status == 'airborne'
  end

  private

  @@num = 0

  def number_gen
    @@num += 1
  end

end
