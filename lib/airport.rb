class Airport
  attr_reader :status

  def initialize
    @status = "open"
  end

  def close
    @status = "closed"
  end

end
