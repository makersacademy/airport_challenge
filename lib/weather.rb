require_relative 'airport'
require_relative 'plane'

class Weather
  attr_reader :sunny

  def sunny?
    today == :sunny
  end

private
ELEMENTS = [:sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :stormy]

  def today
    ELEMENTS.sample
  end
end
