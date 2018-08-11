require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should have somewhere to store instances of planes" do 
    expect(subject.planes).to eq([])
  end

  it "should land a plane" do 
    heathrow = Airport.new
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    expect(heathrow.planes[0].flight_number).to eq("BA123")
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it "should remove given plane from airport when #takeoff is called" do
    heathrow = Airport.new
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    heathrow.takeoff("BA123")
    expect(heathrow.planes[0]).to eq nil 
  end

  it "should return a message to confirm takeoff" do
    heathrow = Airport.new
    expect(heathrow.confirm).to eq("Plane is no longer in the airport.")
  end

  it "should prevent landing when airport is full" do 
    heathrow = Airport.new
    allow(heathrow).to receive(:weather) { "sunny" }
    Airport::DEFAULT_CAPACITY.times { heathrow.land("BA123") }

    expect { heathrow.land("EZ456") }.to raise_error("Airport is full.")
  end

  it "should be able to prevent takeoff during stormy weather" do
    heathrow = Airport.new 
    heathrow.land("BA123")
    allow(heathrow).to receive(:weather) { "stormy" }
    expect { heathrow.takeoff("BA123") }.to raise_error("Cannot land due to weather.")
  end

  it "should be able to prevent landing during stormy weather" do
    heathrow = Airport.new 
    allow(heathrow).to receive(:weather) { "stormy" }
    expect { heathrow.land("BA123") }.to raise_error("Cannot land due to weather.")
  end

  it "should be able to land during sunny weather" do
    heathrow = Airport.new 
    previous_number_planes = heathrow.planes.length
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    expect(heathrow.planes.length).to eq(previous_number_planes + 1)
  end

  it "should be able to takeoff during sunny weather" do 
    heathrow = Airport.new
    heathrow.land("BA123")
    previous_number_planes = heathrow.planes.length
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.takeoff("BA123")
    expect(heathrow.planes.length).to eq(previous_number_planes - 1)
  end

end
