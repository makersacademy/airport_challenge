class Weather

attr_reader :condition

  def initialize
    conditions = ['sunny', 'stormy']
    @condition = conditions.sample
  end

end
