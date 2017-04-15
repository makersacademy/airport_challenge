class Weather

  attr_reader :status

  def initialize(status = {1 => 'sunny', 2 => 'sunny', 3 => 'sunny', 4 => 'stormy'})
    @status = status[rand(1..4)]
  end


end
