require_relative './plane'

class AirTrafficController
  def direct_planes(directions)
    raise 'Unable to direct planes - no directions were specified' if directions.empty?

    directions.each_with_index do |direction, index|
      begin
        direction[1] ? land_plane(direction[0], direction[1]) : take_off_plane(direction[0])
      rescue RuntimeError => e
        raise get_direction_error_message(index, e.message)
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

  def get_direction_error_message(num_processed, message)
    if num_processed.zero?
      "No planes directed. Plane #{num_processed + 1} failed - #{message}"
    elsif num_processed == 1
      "#{num_processed} plane directed. Plane #{num_processed + 1} failed - #{message}"
    else
      "#{num_processed} planes directed. Plane #{num_processed + 1} failed - #{message}"
    end
  end
end
