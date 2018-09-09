class Weather
  attr_accessor :random
  def stormy?
    @random = rand(1550)
    if (48..50).include?(@random)
      return true
    else
    return false
    end
  end

end
