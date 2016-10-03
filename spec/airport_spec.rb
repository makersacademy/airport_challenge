require 'airport'


describe Airport do

   subject(:airport) { described_class.new }
   let(:plane) {double :plane}

    it { is_expected.to respond_to(:land_plane).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument   }
    it { is_expected.to respond_to(:current_weather)             }

    it 'gives the ability to change the weather' do
      expect(airport.change_weather).not_to eq subject
    end

    it 'lets you know the current weather' do
      expect(airport.current_weather).to eq subject.the_weather
    end

 describe '#initalization' do
   subject(:airport) { described_class.new }
    it 'has a default capacity' do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.airport_capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be overwritten' do
     change_capacity = described_class.new(3)
     expect(change_capacity.airport_capacity).to eq 3
    end

  end

describe "#land_plane" do
    subject(:airport) { described_class.new }
    it 'lands a plane' do
     allow(airport).to receive(:stormy?).and_return(false)
     allow(plane).to receive(:land)
     expect(airport.land_plane(plane)).to eq [plane]
   end

    it 'won\'t land a plane if it is already in the airport' do
     allow(airport).to receive(:stormy?).and_return(false)
     allow(plane).to receive(:land)
     airport.land_plane(plane)
     expect { airport.land_plane(plane) }.to raise_error 'This plane has already landed!'
   end

    it 'confirms that the plane has landed at the airport' do
      allow(airport).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      airport.land_plane(plane)
      expect(airport.landing_check(plane)).to eq true
    end

    it "won't land a plane if runway is full" do
      full_airport = described_class.new(1, :Sunny)
      plane_1 = Plane.new
      plane_2 = Plane.new
      full_airport.land_plane(plane_1)
      expect  { full_airport.land_plane(plane_2) }.to raise_error 'DANGER! Runway full'
    end


    it "won't land a plane if the weather is stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:land)
      expect{ airport.land_plane(plane) }.to raise_error 'DANGER! Stormy weather'
    end
  end

 describe "#take_off" do

    it 'won\'t let you let a plane leave the airport that isn\'t there' do
      airport = described_class.new(1, :Sunny)
      plane_1 = Plane.new
      plane_2 = Plane.new
      airport.land_plane(plane_1)
      expect { airport.take_off(plane_2) }.to raise_error 'That plane isn\'t in this airport!'
    end

    it 'lets a plane leave the airport' do
     airport = described_class.new(1, :Sunny)
     allow(plane).to receive(:fly)
     allow(plane).to receive(:land)
     airport.land_plane(plane)
     expect(airport.take_off(plane)).to eq []
    end

    it 'won\'t let the plane take off if it\'s stormy' do
      airport = described_class.new(1, :Sunny)
      allow(plane).to receive(:land)
      airport.land_plane(plane)
      airport = described_class.new(1, :Stormy)
      allow(plane).to receive(:fly)
      expect{ airport.take_off(plane) }.to raise_error 'DANGER! Stormy weather'
    end

    it 'confirms that the plane has left the airport' do
      airport = described_class.new(1, :Sunny)
      allow(plane).to receive(:land)
      allow(plane).to receive(:fly)
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.take_off_check(plane)).to eq true
    end
  end
end
