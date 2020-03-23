require_relative './plane'

class AirTrafficController
  def direct_planes(directions)
    directions_processed = 0
      directions.each_with_index do |direction, index|
        begin
          if direction[1]
            direction[0].land(direction[1])    
          else
            direction[0].take_off
          end
          directions_processed += 1
        rescue
          return 'No planes were successfully directed'
        end
      end
    'All planes successfully directed'
  end
end