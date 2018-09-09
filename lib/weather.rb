class Weather

  attr_accessor :random


  def stormy?
    @random = rand(1550)
    if (48..50).include?(@random)
      @random = "stormy"
    else
     @random = "sunny"
    end
  end

end
