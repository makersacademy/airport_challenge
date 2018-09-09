class Weather

  attr_accessor :condition

  def initialize(condition = "")
    conditions = ['sunny', 'stormy']
    if condition.length.positive? && conditions.include?(condition)
      @condition = condition
    else
      @condition = conditions[rand(0..1)]
    end
  end


end
