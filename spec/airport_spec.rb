require './lib/airport'
  describe Airport do
      airport = Airport.new

   it "Does plane land at the airport" do
     allow(airport.weather).to receive(:generate) {"Sunny"}
    expect{airport.land(Plane.new)}. to output("Plane landed!").to_stdout
   end

   it "Does plane take off from airport" do
     airport = Airport.new
     allow(airport.weather).to receive(:generate) {"Sunny"}
     plane = Plane.new
     expect{airport.take_off}. to output("Plane has taken off!").to_stdout
   end

   it "Airport full of planes. No room to land!" do
     airport = Airport.new
     allow(airport.weather).to receive(:generate) {"Sunny"}
     20.times {airport.land(Plane.new)}
     expect {airport.land(Plane.new)}.to raise_error("The airport is full.")
   end

  it "Prevent take off when weather is stormy." do
    airport = Airport.new
    allow(airport.weather).to receive(:generate) {"Stormy weather!"}
    expect {airport.take_off}.to raise_error("There's a storm brewing and you can't fly off.")
  end

 it "Prevent landing when weather is stormy" do
   airport = Airport.new
   plane = Plane.new
   allow(airport.weather).to receive(:generate) {"Stormy weather!"}
   expect {airport.land(plane)}.to raise_error("There's a storm brewing. You can't land.")
 end

end
