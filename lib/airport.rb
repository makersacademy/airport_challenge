class Airport
  attr_reader :planes
  attr_writer :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = 0
    @weather = "clear"
    @capacity = capacity
  end

  def land
    if @weather == "stormy"
      raise "cannot land while weather is stormy"
    elsif full?
      raise "cannot land while airport is full"
    else
      @planes += 1
    end
  end

  def take_off
    if @weather == "stormy"
      raise "cannot take off while weather is stormy"
    else
      @planes -= 1
    end
  end

  def weather(report)
    @weather = report
  end

  def full?
    @planes >= @capacity
  end
end
