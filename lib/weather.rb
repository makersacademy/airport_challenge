class Weather

  attr_reader :stormy

  def initialize
    @stormy = stormy?(random_number)
  end

  def stormy?(random_number)
    return true if random_number == 0
    false
  end

  def random_number
    rand(5)
  end

end
