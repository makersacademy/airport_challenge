require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end



end

#I want to test whether the class method is assigning the parameter to an instance variable.
