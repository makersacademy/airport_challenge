class Weather
  attr_reader :state

  def initialize
    @state = [*1..100].sample
  end

  def stormy?
    state > 90
  end
end
