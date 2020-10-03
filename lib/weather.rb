class Weather
  attr_reader :options
  
  def initialize
    @options = [:stormy, :sunny, :sunny, :sunny, :sunny, :sunny]
  end

  def generate
    options.sample
  end

  def stormy?
    generate == :stormy
  end
end