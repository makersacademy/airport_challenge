class Weather

  def initialize
    @chance_of_storm = (1..5).to_a
  end

  def generate
    @chance_of_storm.sample <= 2 ? 'Stormy' : 'Sunny'
  end 
end
