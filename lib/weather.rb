class Weather

  attr_reader :check
  def check
    true if rand(1..5) != 1
  end
end