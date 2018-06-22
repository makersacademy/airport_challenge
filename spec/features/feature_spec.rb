require 'airport'
require 'plane'

describe 'Land a plane in sunny weather' do

  airport = Airport.new
  planes = (1..20).map{ |i| Plane.new }
  planes.each { |plane| plane.land(airport) }
  planes.each do |plane|
    if plane.isAirborne?
      puts "plane is still airborne"
    end
  end

end
