require_relative './plane'

class AirTrafficController
  def direct_planes(directions)
    directions_processed = 0
      directions.each_with_index do |direction, index|
        begin
          direction[1] ? land_plane(direction[0], direction[1]) : take_off_plane(direction[0])
          directions_processed += 1
        rescue RuntimeError => e
          return get_direction_error_message(directions_processed, e.message)
        end
      end
    'All planes successfully directed'
  end

  private

  def land_plane(plane, airport)
    plane.land(airport)
  end

  def take_off_plane(plane)
    plane.take_off
  end

  def get_direction_error_message(directions_processed, error_message)
    if directions_processed == 0
      "No planes were successfully directed. Plane #{directions_processed + 1} failed - #{error_message}"
    elsif directions_processed == 1
      "#{directions_processed} plane was successfully directed. Plane #{directions_processed + 1} failed - #{error_message}"
    else
      "#{directions_processed} planes were successfully directed. Plane #{directions_processed + 1} failed - #{error_message}"
    end
  end
end