require './lib/plane.rb'

airport = Airport.new(4)
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
plane5 = Plane.new

planes = [plane1, plane2, plane3, plane4, plane5]

while airport.hangar.length < 4
  planes.each do |plane|
    begin
      plane.land(airport)
      puts "Current hangar:"
      puts airport.hangar
      puts "----"
    rescue
      puts $!
      next
    end
  end
end

while airport.hangar.length.positive?
  planes.each do |plane|
    begin
      plane.take_off
      puts "Current hangar:"
      puts airport.hangar
      puts "----"
    rescue
      puts $!
      next
    end
  end

end
