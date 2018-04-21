class Weather
  attr_reader :stormy

  def initialize
    @stormy = stormy_decision_maker
  end

  def stormy?
    @stormy
  end

  def stormy_decision_maker
    chance <= 2
  end

  def chance
    rand(10)
  end
end
