class Climate

  attr_reader :possible_conditions

  def initialize
    @possible_conditions = [:sunny, :sunny, :sunny, :stormy]
  end

  def conditions
    possible_conditions.sample
  end

end
