class Weather


  def initialize
    @sunny = ["sunny", "sunny", "sunny", "sunny", "sunny", "stormy"].sample
  end

  def sunny?
    if @sunny == "sunny"
      true
    else
      false
    end
  end

end
