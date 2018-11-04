class Weather

  attr_reader :operable

  def operable?
    @stormy ? false : true
  end

  def stormy
    @stormy = true
  end

end