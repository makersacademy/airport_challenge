class Airport
  attr_reader :status, :capacity

  def initialize(capacity = 50)
    @capacity = capacity
    @status = "open"
  end

  def close
    @status = "closed"
  end

  def open
    @status = "open"
  end

end
