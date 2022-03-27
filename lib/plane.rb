require 'byebug'
require 'airport'
require 'weather'
# do not need these required files

class Plane
  attr_reader :is_flying

  def initialize
    @is_flying = false
  end

  def land
    fail "Plane cannot land as it's already landed" unless @is_flying
    @is_flying = false
  end

  def take_off
    fail "This plane is currently flying" if @is_flying
    @is_flying = true
  end
end
