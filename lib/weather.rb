class Weather
  attr_accessor :condition

  def initialize(condition="")
    conditions = ['sunny','stormy']
    if condition.length > 0 && conditions.include?(condition)
      @condition = condition
    else
      @condition = conditions[rand(0..1)]
    end
  end
end
