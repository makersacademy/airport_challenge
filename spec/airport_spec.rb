require_relative '../lib/airport.rb'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane_a) { double(:plane_a) }
  let(:plane_b) { double(:plane_b) }
  let(:weather) { double(:weather) }

  describe '#capacity' do
    it "should have default capacity" do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it "should have correct capacity when created specified capacity" do
      [4, 6, 7, 8, 343].each do |num|
        expect(Airport.new(num).capacity).to eq(num)
      end
    end
    it "the operator can change the capacity" do
      [4, 6, 7, 8, 343].each do |num|
        airport = Airport.new(num)
        expect(airport.capacity + 50).to eq(num + 50)
      end
    end
  end
  describe '#takeoff_ok' do
    it "should be remove the plane from the airport's list of planes" do
      airport.capacity = 1
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      airport.landing_ok?(plane_a)
      airport.takeoff_ok?(plane_a)
      expect(airport.landing_ok?(plane_b)).to eq(true)
    end
    it "shouldn't takeoff when weather is stormy, and tell operator" do
      airport.landing_ok?(plane_a)
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect { airport.takeoff_ok?(plane_a) }.to output("weather is stormy\n").to_stdout
    end
  end
  describe '#landing_ok?' do
    it "should be false if the airport if full, and tell the operator about the situation" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      airport.capacity = 1
      airport.landing_ok?(plane_a)
      expect { airport.landing_ok?(plane_b) }.to output("#{airport} is full\n").to_stdout
    end
    it "shouldn't land when weather is stormy, and tell operator" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect { airport.landing_ok?(plane_a) }.to output("weather is stormy\n").to_stdout
    end
  end
end
