class Planes
  attr_reader :plane_now
  @plane_commit = {"airborne_pass" => false,
      "airborne_green_land" => false,
      "airborne_red_land" => false,
      "airborne_request_land" => false,
      "airborne_landing"  => false, 
      "grounded_landing" => false,
      "passengers_out" => false,
      "refueling" => false, 
      "grounded_inspected" => false,
      "grounded_flight_ready" => false,
      "passengers_in" => false, 
      "grounded_red_takeoff" => false, 
      "grounded_green_takeoff" => false,
      "grounded_request_takeoff" => false,
      "grounded_takingoff" => false,
      "airborne_takingoff" => false,
      "exemption_now" => false,
      "exemption_future" => false,
      "latitude" => false,
      "longitude" => false,
      "altitude" => false,
      "emergency_level_tower" => false
    }
  def intitialize
    @plane_now = @plane_commit
  end

  def commence_procedure(now_exe = "none", next_exe = "none")
    if @plane_now.key?(now_exe) && @plane_now.key?(next_exe)
      clean_state
      @plane_now[now_exe] = true
      @plane_now[next_exe] = true
    else
      @plane_now["exemption_now"] = now_exe
      @plane_now["exemption_future"] = next_exe
    end

  end

  def clean_state
    @plane_now.update!(@plane_now){ |key, value| 0}
  end
end