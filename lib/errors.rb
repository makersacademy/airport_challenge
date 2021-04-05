class TakeOffError < StandardError
  attr_reader :msg

  def initialize(msg = 'Airport is empty!')
    super(msg)
  end
end

class LandingError < StandardError
  attr_reader :msg

  def initialize(msg = 'Airport is full!')
    super(msg)
  end
end