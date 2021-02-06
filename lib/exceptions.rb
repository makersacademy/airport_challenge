class CapacityError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'AIRPORT FULL - DO NOT LAND - Please Await Instruction'
    super(msg)
  end
end
