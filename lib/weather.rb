class Weather
  def initialize(stormy)
    @stormy = stormy
  end

  def stormy
    if @stormy == "yes"
      true
    else
      false
    end
  end
end
