require_relative 'weather'

class Plane

    attr_reader :condition
    
  def initialize(condition = :sunny)
    @condition = condition
  end

  # def permission_to_fly_or_land
  #   @condition
  # end
  #
  # def denied_permission_to_fly_or_land
  #   @condition = :stormy
  # end
end
