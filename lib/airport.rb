require_relative 'control_tower'

class Airport
  attr_reader :control_tower, :planes

  def initialize
    @control_tower = ControlTower.new
    @planes = []
  end

  def park plane
    planes << plane
  end
end
