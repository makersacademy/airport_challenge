require_relative  "../lib/airport.rb"
require_relative  "../lib/plane.rb"


describe Airport do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}
  
  it "instructs a plane to land at an airport" do
    
    airport.land(plane)
    allow(airport).to receive(:stormy?).and_return false
    expect(airport.landed_planes). to eq [plane]
  end

  it "instructs a plane to take off and confirms it is no longer in the airport" do
  
    
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    allow(airport).to receive(:stormy?).and_return false
    airport.take_off(plane)
    allow(airport).to receive(:stormy?).and_return false
    expect(airport.landed_planes).to eq []
   
    plane2 = Plane.new
    airport.land(plane2)
    allow(airport).to receive(:stormy?).and_return false
    expect(airport.take_off(plane2)).to eq "#{plane2} has taken off and is no longer in the airport" 
  end

  it "prevents landing when airport is full" do
  
    allow(airport).to receive(:stormy?).and_return false
    
    25.times do
      airport.land(plane)
    end
    expect(airport.land(plane)).to eq "plane cannot land: airport full. "
  end

  it "default airport capacity can be overridden" do
    airport1 = Airport.new #default capacity is 25
    airport2 = Airport.new #different airport, need to change capacity to 20
    expect(airport2.change_capacity(20)).to eq 20
    allow(airport2).to receive(:stormy?).and_return false

    #land 21 planes at airport2 to see if it raises the error
    plane = Plane.new
    20.times do
      airport2.land(plane)
    end
    expect(airport2.land(plane)).to eq "plane cannot land: airport full. "
  end

  it "prevents takeoff when stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true  #stub: allows consistent tests
    expect(airport.take_off(plane)).to eq "plane cannot takeoff: weather is stormy"
  end

  it "prevents landing when stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true  #stub: allows consistent tests
    expect(airport.land(plane)).to eq "plane cannot land: weather is stormy"
  end






end


