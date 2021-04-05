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

class PlaneLandedError < StandardError
  attr_reader :msg

  def initialize(msg = 'Plane already in airport')
    super(msg)
  end
end

class PlaneTakeoffError < StandardError
  attr_reader :msg

  def initialize(msg = 'Plane already in flight')
    super(msg)
  end
end
