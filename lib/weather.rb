
class Weather

  attr_reader :stormy

  def initialize
    @stormy = conditions
  end

  private
  def conditions
    rand(2)
  end

end
