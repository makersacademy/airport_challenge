require './lib/airport'
  describe Airport do
      airport = Airport.new

  it "Does plane land at the airport" do
    expect{airport.land(Plane.new)}. to output("Plane landed!").to_stdout
  end

  it "Does plane take off from aiport" do
    plane = Plane.new
   expect{airport.take_off}. to output("Plane has taken off!").to_stdout
  end

  it "Airport full of planes. No room to land!" do
    airport = Airport.new
    20.times {airport.land(Plane.new)}
    expect {airport.land(Plane.new)}.to raise_error("The airport is full.")
  end

end
