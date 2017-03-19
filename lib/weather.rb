class Weather
  STATES = [ :sunny ,:sunny, :stormy]
  attr_reader :state

  def initialize
    @state =  STATES.sample
  end

  def stormy?
    @state == :stormy
  end
end
