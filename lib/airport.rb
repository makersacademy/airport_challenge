require_relative 'control_tower'

class Airport
  attr_reader :control_tower

  def initialize
    @control_tower = ControlTower.new
  end
end
