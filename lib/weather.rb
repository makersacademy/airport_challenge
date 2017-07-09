class Weather

  attr_reader :stormy

  def initialize
    @stormy = rand(20) == 19 ? true : false
  end

end
