class Weather

  def initialize
    number = rand(0..31)
    @storm (number % 3 == 0) && (number % 5 == 0) ? true : false
  end

  def ok_fly
    @storm
  end

end
