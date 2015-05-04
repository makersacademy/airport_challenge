class Plane

  attr_reader :status

  def initialize
    @status = 'flying'
  end

  def take_off
#    fail "Plane currently in maintenance" if @status = 'in maintenance'
    @status = 'flying'
  end

  def land
    @status = 'landed'
  end

  def maintenance
  	@status = 'in maintenance'
  end

end
