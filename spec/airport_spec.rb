require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double(:plane) }
  it "#report_weather should return a random weather condition" do
    count = 0
    10.times { count += 1 if airport.report_weather != airport.report_weather }
    expect(count).to be > 3
  end

  context "In Stormy weather" do
    it "#prevent_take_off should prevent take off when report_weather returns 'stormy'" do
      allow(airport).to receive(:report_weather).and_return("stormy")
      expect(airport.prevent_take_off).to eq true
    end
  end

  context "Any acceptable weather" do
    it "#prevent_take_off should allow take off when report_weather returns 'sunny'" do
      allow(airport).to receive(:report_weather).and_return("sunny")
      expect(airport.prevent_take_off).to eq false
    end

    it "#prevent_take_off should allow take off when report_weather returns 'mild'" do
      allow(airport).to receive(:report_weather).and_return("mild")
      expect(airport.prevent_take_off).to eq false
    end

    it "#prevent_take_off should allow take off when report_weather returns 'rainy'" do
      allow(airport).to receive(:report_weather).and_return("rainy")
      expect(airport.prevent_take_off).to eq false
    end
  end

  it "#stormy? returns true if the weather is stormy" do
    allow(airport).to receive(:report_weather).and_return("stormy")
    expect(airport.stormy?).to eq true
  end

  it "#stormy? returns false if the weather is not stormy" do
    allow(airport).to receive(:report_weather).and_return("rainy")
    expect(airport.stormy?).to eq false
  end

  it "#prevent_landing returns true if the weather is stormy" do
    allow(airport).to receive(:stormy?).and_return(true)
    expect(airport.prevent_landing).to eq true
  end

  it "#prevent_landing returns false if the weather is not stormy" do
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport.prevent_landing).to eq false
  end

  it "#prevent_landing returns true if the weather is stormy and the airport is not full" do
    allow(airport).to receive(:stormy?).and_return(true)
    allow(airport).to receive(:full?).and_return(false)
    expect(airport.prevent_landing).to eq true
  end

  it "#prevent_landing returns true if the weather is not stormy and the airport is full" do
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:full?).and_return(true)
    expect(airport.prevent_landing).to eq true
  end

  it "#prevent_landing returns true if the weather is stormy and the airport is full" do
    allow(airport).to receive(:stormy?).and_return(true)
    allow(airport).to receive(:full?).and_return(true)
    expect(airport.prevent_landing).to eq true
  end

  it "#prevent_landing returns false if the weather is not stormy and the airport is not full" do
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:full?).and_return(false)
    expect(airport.prevent_landing).to eq false
  end

  it "should initialise an Airport instance with 500 available spots for planes" do
    expect(airport.capacity).to eq 500
  end

  it "should initialise an Airport instance with 100 available spots for planes" do
    airport_instance = Airport.new(100)
    expect(airport_instance.capacity).to eq 100
  end

  it "should initialize an empty array" do
    expect(airport.landed_airplanes).to be_instance_of Array
  end

  it "#request_to_land should return true if a plane lands at the airport" do
    allow(airport).to receive(:full?).and_return(false)
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport.request_to_land(plane)).to eq true
  end

  it "#request_to_land should return false if a plane cannot land at the airport" do
    allow(airport).to receive(:full?).and_return(true)
    expect(airport.request_to_land(plane)).to eq false
  end

  it "#request_to_land should increase the landed_airplanes counter by one" do
    count = airport.landed_airplanes.count
    allow(airport).to receive(:prevent_landing).and_return(false)
    airport.request_to_land(plane)
    expect(airport.landed_airplanes.count - 1).to eq count
  end

  it "#request_to_take_off should return true if take off takes place" do
    allow(airport).to receive(:prevent_take_off).and_return(false)
    expect(airport.request_to_take_off(plane)).to eq true
  end

  it "#request_to_take_off should return false if take off cannot take place" do
    allow(airport).to receive(:prevent_take_off).and_return(true)
    expect(airport.request_to_take_off(plane)).to eq false
  end

  it "#request_to_take_off should decrease the landed_airplanes counter by one" do
    allow(airport).to receive(:prevent_landing).and_return(false)
    airport.request_to_land(plane) 
    count = airport.landed_airplanes.count
    allow(airport).to receive(:prevent_take_off).and_return(false)
    airport.request_to_take_off(plane)
    expect(airport.landed_airplanes.count + 1).to eq count
  end
end      
    