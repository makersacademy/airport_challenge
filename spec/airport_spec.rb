require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double :plane}

  describe "#initialize" do
    it "capacity can be user set" do
      airport = Airport.new(3)
      allow(plane).to receive(:land) {}
      allow(airport).to receive(:fly_okay?).and_return(true)
      3.times {airport.land_plane(plane)}
      expect{ airport.land_plane(plane) }.to raise_error "Airport full!!!"
    end
  end

  describe "#land_plane" do

    it "accepts a plane to land" do
      allow(airport).to receive(:fly_okay?).and_return(true)
      allow(plane).to receive(:land) {}
      airport.land_plane(plane)
      expect(airport.count_planes).to eq 1
    end

    it "accepts multiple planes" do
      allow(airport).to receive(:fly_okay?).and_return(true)
      allow(plane).to receive(:land) {}
      10.times { airport.land_plane(plane) }
      expect(airport.count_planes).to eq 10
    end

    it "stops a plane landing if there is stormy weather" do
      allow(plane).to receive(:land) {}
      allow(airport).to receive(:fly_okay?).and_return(false)
      expect{ airport.land_plane(plane) }.to raise_error "Landing delayed due stormy weather"
    end

    it "prevents plane from landing when airport full" do
      allow(plane).to receive(:land) {}
      allow(airport).to receive(:fly_okay?).and_return(true)
      Airport::DEFAULT_CAPACITY.times {airport.land_plane(plane)}
      expect{ airport.land_plane(plane) }.to raise_error "Airport full!!!"
    end
  end

  describe "#take_off" do
    it "lets a plane take off" do
      allow(plane).to receive(:take_off) {}
      allow(airport).to receive(:plane_in_airport?).with(plane).and_return(true)
      airport.planes << [plane,plane]
      allow(airport).to receive(:fly_okay?).and_return(true)
      airport.take_off(plane)
      expect(airport.count_planes).to eq 1
    end

    it "stops take off in the event of stormy weather" do
      airport.planes << [plane,plane]
      allow(airport).to receive(:plane_in_airport?).with(plane).and_return(true)
      allow(airport).to receive(:fly_okay?).and_return(false)
      expect{airport.take_off(plane)}.to raise_error "Flight canceled due stormy weather"
    end

    it "cancels a take off is a plane isn't in the" do
      allow(airport).to receive(:fly_okay?).and_return(true)
      expect {airport.take_off(plane)}.to raise_error "This plane isn't here!"

    end
  end

  describe "#fly_okay?" do
    it "confirms planes can fly in normal weather" do
      allow(Weather).to receive(:check_weather).and_return(:safe_to_fly)
      expect(airport.fly_okay?).to eq true
    end

    it "confirms planes cann't fly in stormy weather" do
      allow(Weather).to receive(:check_weather).and_return(:stormy)
      expect(airport.fly_okay?).to eq false
    end
  end

  describe "#full" do
    it 'returns false if capacity is full' do
      20.times { airport.planes << [plane] }
      expect(airport.full?).to eq true
    end
  end
end
