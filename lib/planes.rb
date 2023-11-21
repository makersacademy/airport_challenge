class Planes
  attr_reader :plane_now
 
  def initialize
    @plane_now = {airborne_pass: :none,
    airborne_green_land: :none,
    airborne_red_land: :none,
    airborne_request_land: :none,
    airborne_landing: :none, 
    grounded_landing: :none,
    passengers_out: :none,
    refueling: :none, 
    grounded_inspected: :none,
    grounded_flight_ready: :none,
    passengers_in: :none, 
    grounded_red_takeoff: :none, 
    grounded_green_takeoff: :none,
    grounded_request_takeoff: :none,
    grounded_takingoff: :none,
    airborne_takingoff: :none,
    exemption_now: :none,
    exemption_future: :none,
    latitude: :none,
    longitude: :none,
    altitude: :none,
    distress: :none,
    emergency_level_tower: :none}
  end

  def commence_procedure(now_exe = :exemption_now, next_exe = :exemption_future)
    @plane_now.key?(now_exe) ? clean_state : nil
    @plane_now[now_exe] = :now
    @plane_now[next_exe] = :next
  end

  def clean_state
    @plane_now.merge!(@plane_now) { |key, value| :none }
  end

  def get_state
    @plane_now.find { |key, value| value == :now }
  end
end