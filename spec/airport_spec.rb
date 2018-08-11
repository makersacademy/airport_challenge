require 'airport'
require 'plane'

describe Airport do

  let(:heathrow) { Airport.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should have somewhere to store instances of planes" do 
    expect(subject.planes).to eq([])
  end

  it "should land a plane" do 
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    expect(heathrow.planes[0].flight_number).to eq("BA123")
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it "should remove given plane from airport when #takeoff is called" do
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    heathrow.takeoff("BA123")
    expect(heathrow.planes[0]).to eq nil 
  end

  it "should return a message to confirm takeoff" do
    expect(heathrow.confirm).to eq("Plane is no longer in the airport.")
  end

  it "should prevent landing when airport is full" do 
    allow(heathrow).to receive(:weather) { "sunny" }
    Airport::DEFAULT_CAPACITY.times { heathrow.land("BA123") }

    expect { heathrow.land("EZ456") }.to raise_error("Airport is full.")
  end

  it "should be able to prevent takeoff during stormy weather" do 
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    allow(heathrow).to receive(:weather) { "stormy" }
    expect { heathrow.takeoff("BA123") }.to raise_error("Cannot takeoff due to weather.")
  end

  it "should be able to prevent landing during stormy weather" do 
    allow(heathrow).to receive(:weather) { "stormy" }
    expect { heathrow.land("BA123") }.to raise_error("Cannot land due to weather.")
  end

  it "should be able to land during sunny weather" do 
    previous_number_planes = heathrow.planes.length
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    expect(heathrow.planes.length).to eq(previous_number_planes + 1)
  end

  it "should be able to takeoff during sunny weather" do 
    allow(heathrow).to receive(:weather) { "sunny" }
    heathrow.land("BA123")
    previous_number_planes = heathrow.planes.length
    heathrow.takeoff("BA123")
    expect(heathrow.planes.length).to eq(previous_number_planes - 1)
  end

  it "#weather should return sunny when #random_numer is 1" do 
    allow(heathrow).to receive(:random_number) { 1 }
    expect(heathrow.weather).to eq("sunny")
  end

  it "#weather should return sunny when #random_numer is 5" do 
    allow(heathrow).to receive(:random_number) { 5 }
    expect(heathrow.weather).to eq("sunny")
  end

  it "#weather should return storym when #random_numer is 9" do 
    allow(heathrow).to receive(:random_number) { 9 }
    expect(heathrow.weather).to eq("stormy")
  end

end
