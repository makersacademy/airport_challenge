Weather = Class.new

class Weather

  attr_reader :stormy

  def initialize
    if rand(100).to_i >= 90
      @stormy = true
    else
      @stormy = false
    end
  end

end
