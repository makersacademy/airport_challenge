require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double :plane }
  
  it { is_expected.to respond_to(:instruct_landing).with(1).argument }
  it { is_expected.to respond_to :instruct_take_off }
  it { is_expected.to respond_to :check_weather }
  
  it "has a defualt capacity" do
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "default capacity can be overwritten for new airports" do
    london_heathrow = Airport.new(50)
    expect(london_heathrow.capacity).to eq 50
  end

  describe "#instruct_landing" do
    
    it "raises an error if the airport is full" do
      allow(airport).to receive(:check_weather).and_return('Sunny')
      airport.capacity.times { airport.instruct_landing(plane) }
      expect { airport.instruct_landing(plane) }.to raise_error "AIRPORT AT FULL CAPACITY!"
    end

    it "raises an error when the weather is stormy" do
      london_heathrow = Airport.new
      allow(london_heathrow).to receive(:check_weather).and_return('Stormy')
      expect { london_heathrow.instruct_landing(plane) }.to raise_error "STORMY WEATHER: CANNOT LAND"
    end
  end

  describe "#instruct_take_off" do
    it "can instruct a plane to take_off" do
      allow(airport).to receive(:check_weather).and_return('Sunny')

      airport.instruct_landing(plane)
      expect(airport.instruct_take_off).to eq(plane)
    end

    it "raises error when the weather is stormy" do
      allow(airport).to receive(:check_weather).and_return('Stormy')
      expect { airport.instruct_take_off }.to raise_error "STORMY WEATHER: CANNOT TAKE OFF"
    end

    it "does not raise error when the weather is sunny" do
      allow(airport).to receive(:check_weather).and_return('Sunny')
      expect { airport.instruct_take_off }.to_not raise_error 
    end
  end
end
