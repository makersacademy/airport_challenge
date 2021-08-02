require 'securerandom'

class Plane
  attr_reader :is_landed, :id

  def initialize(is_landed = true)
    @is_landed = is_landed
    @id = SecureRandom.uuid
  end

  def take_off
    change_state(false, "Plane has already taken off")
  end

  def land
    change_state(true, "Plane has already landed")
  end

  private

  def change_state(state, message)
    raise message if is_landed == state
    
    @is_landed = state
  end

end
