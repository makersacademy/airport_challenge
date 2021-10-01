require_relative 'airport_status_codes'

class Airport
  include AirportStatusCodes

  DEFAULT_AIRPORT_CAPACITY = 20

  def initialize(
    airport_name, 
    code, 
    capacity = DEFAULT_AIRPORT_CAPACITY, 
    runway_status = RUNWAY_EMPTY)
    @airport_name = airport_name
    @code = code
    @capacity = capacity
    @plane_count = 0
    @runway_status = runway_status
    @plane_using_runway = RUNWAY_EMPTY
  end

  attr_reader :airport_name, :code, :capacity, :runway_status, :plane_using_runway, :plane_count

  def prepare_for_landing(plane_id)
    if runway_is_empty? && space_for_landing?
      update_runway(plane_id, LANDING)
      OK
    else
      full_or_busy
    end
  end

  def prepare_for_take_off(plane_id)
    if runway_is_empty?
      update_runway(plane_id, TAKE_OFF)
      OK
    else
      :busy
    end
  end

  def land
    if runway_is_empty? || plane_taking_off?
      "No planes cleared for landing"
    else
      clear_runway
      increase_plane_count
      OK
    end
  end

  def take_off
    if runway_is_empty? || plane_landing?
      "No planes cleared for take off"
    else 
      clear_runway
      decrease_plane_count
      OK
    end
  end

  private

  def full_or_busy
    if airport_is_full?
      FULL
    elsif runway_is_busy?
      BUSY
    end
  end

  def update_runway(plane_id, condition)
    @plane_using_runway = plane_id
    @runway_status = condition
  end

  def increase_plane_count
    @plane_count += 1
  end

  def decrease_plane_count
    @plane_count -= 1
  end

  def clear_runway
    @runway_status = RUNWAY_EMPTY
    @plane_using_runway = RUNWAY_EMPTY
  end

  def runway_is_empty?
    @runway_status == RUNWAY_EMPTY
  end

  def runway_is_busy?
    @runway_status != RUNWAY_EMPTY
  end

  def plane_landing?
    @runway_status == LANDING
  end

  def plane_taking_off?
    @runway_status == TAKE_OFF
  end

  def space_for_landing?
    @plane_count < @capacity
  end

  def airport_is_full?
    @plane_count == @capacity
  end
end
