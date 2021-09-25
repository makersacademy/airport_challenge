require_relative '../errors/airport_full_error'
require_relative '../errors/bad_weather_error'
require_relative '../errors/not_a_plane_error'
require_relative '../errors/plane_already_landed_error'
require_relative '../errors/plane_not_at_airport_error'
class Airport

  DEFAULT_CAPACITY = 20
  RUNWAY_EMPTY = :empty
  LANDING = :landing
  TAKE_OFF = :take_off
  SUCCESS = :ok
  BUSY = :busy
  FULL = :full

  def initialize(airport_name, code, capacity = DEFAULT_CAPACITY, runway_status = RUNWAY_EMPTY)
    @airport_name = airport_name
    @code = code
    @capacity = capacity
    @plane_count = 0
    @runway_status = runway_status
    @plane_on_runway = RUNWAY_EMPTY
  end

  attr_reader :airport_name, :code, :capacity, :runway_status, :plane_on_runway, :plane_count

  def prepare_for_landing(plane_id)
    prepare_runway(plane_id, LANDING)
  end

  def prepare_for_take_off(plane_id)
    prepare_runway(plane_id, TAKE_OFF)
  end

  def land
    unless runway_is_empty? || take_off_mode
      clear_runway
      increase_plane_count
      SUCCESS
    else
      "No planes cleared for landing"
    end
  end

  def take_off
    unless runway_is_empty? || landing_mode
      clear_runway
      decrease_plane_count
      SUCCESS
    else
      "No planes cleared for landing"
    end
  end

  private

  def prepare_runway(plane_id, condition)
    if runway_is_empty? && space_at_airport?
      @plane_on_runway = plane_id
      @runway_status = condition
      SUCCESS
    else
      if airport_is_full?
        FULL
      elsif runway_is_busy?
        BUSY
      end
    end
  end

  def landing_mode
    @runway_status == LANDING
  end

  def take_off_mode
    @runway_status == TAKE_OFF
  end

  def increase_plane_count
    @plane_count += 1
  end

  def decrease_plane_count
    @plane_count -= 1
  end

  def clear_runway
    @runway_status = RUNWAY_EMPTY
    @plane_on_runway = RUNWAY_EMPTY
  end

  def runway_is_empty?
    @runway_status == RUNWAY_EMPTY
  end

  def runway_is_busy?
    @runway_status != RUNWAY_EMPTY
  end

  def space_at_airport?
    @plane_count < @capacity
  end

  def airport_is_full?
    @plane_count == @capacity
  end


end
