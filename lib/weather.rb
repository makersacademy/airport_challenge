class Weather
  STATUS = rand(1...10)
  attr_reader :status
  def initialize
    @status = STATUS
  end

  def stormy?
    @status < 4
  end

  def sunny?
    @status > 3
  end
end
