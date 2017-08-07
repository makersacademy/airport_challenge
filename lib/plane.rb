require 'airport'

class Plane

  def initialize
    @airport = nil
    @location = "grounded"
    @action_status = nil
  end
  attr_accessor :airport, :location
  attr_reader :action_status

  def clear_for_action(command, location = nil)
    if command == "land" && location != nil
      @action_status = location
    elsif command == "takeoff"
      @action_status = command
    else raise "Not a valid clearance command"
    end
    # allow action status to be "takeoff" or landing plus airport_id which enables landing
  end

  def land
    raise "Not clear for landing" unless @action_status != nil && @action_status.is_a?(Symbol)
    @airport = @action_status; @location = "grounded"; @action_status = nil
    # brings plane down safely if clear for action, changes location to grounded,
    # airport to airport and switches back action status
  end

  def take_off
    raise "Not clear for takeoff" unless @action_status == "takeoff"
    @airport = nil; @location = "flying"; @action_status = nil
    # plane takes off if clear for action, changes location to flying
    # and switches back action status to false
  end

end
