class Weather

  attr_reader :possible_climates

  def initialize
    @possible_climates = [:sunny, :sunny, :sunny, :stormy]
  end

  def conditions
    [:sunny, :sunny, :sunny, :stormy].sample
  end

end
