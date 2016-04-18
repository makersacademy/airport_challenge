class Weather

  def initialize
    @number = rand(1..10)
  end

  def sunny?
    number == 5 ? false : true
  end

  def stormy?
    return false if sunny?
    true
  end

  private

    attr_reader :number
end
