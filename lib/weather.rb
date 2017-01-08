class Weather

attr_accessor :sunny

  def initialize
    @sunny = true

  end

  def sunny?

    @sunny = rand(1..30) == 1 ? false : true

  end

end
