class Weather

attr_accessor :sunshine

  def initialize
    @sunshine = true

  end

  def sunshine?

    @sunshine = rand(1..30) == 1 ? false : true

  end

end
