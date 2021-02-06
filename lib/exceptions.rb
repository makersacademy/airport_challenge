class CapacityError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'AIRPORT FULL - DO NOT LAND - Please Await Instruction'
    super(msg)
  end
end

class AirportError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Planes can only take off from airports they are in'
    super(msg)
  end
end
