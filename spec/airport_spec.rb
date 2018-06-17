require './lib/airport.rb'

describe Airport do
  let(:airport) { $airport = Airport.new }

  describe '#current_weather' do
    it { is_expected.to respond_to(:current_weather) }
  end

  describe '#landed_planes' do
    it { is_expected.to respond_to(:landed_planes) }
  end

  describe '#request_landing' do
    it { is_expected.to respond_to(:request_landing) }

    it 'should refuse landing if full' do
      allow(airport).to receive(:full?) { true }
      expect {
        airport.request_landing
      }.to raise_error 'Plane cannot land in a full airport'
    end

    it 'should refuse landing if stormy' do
      airport.instance_variable_set(:@current_weather, :stormy)
      expect {
        airport.request_landing
      }.to raise_error 'Weather prevents landing'
    end

    it 'should allow landing if clear and not full' do
      airport.instance_variable_set(:@current_weather, :clear)
      expect(airport.request_landing).to eq true
    end
  end

  describe '#request_takeoff' do
    it { is_expected.to respond_to(:request_takeoff) }

    it 'should refuse takeoff if stormy' do
      airport.instance_variable_set(:@current_weather, :stormy)
      expect {
        airport.request_takeoff
      }.to raise_error 'Weather prevents takeoff'
    end

    it 'should allow takeoff if clear' do
      airport.instance_variable_set(:@current_weather, :clear)
      expect(airport.request_takeoff).to eq true
    end
  end

  describe '#store_plane' do
    it { is_expected.to respond_to(:store_plane).with(1).argument }

    it 'a stored plane should be in the landed_planes array' do
      plane = double(:plane)
      airport.store_plane(plane)
      expect(airport.landed_planes).to include plane
    end
  end

  describe '#remove_plane' do
    it { is_expected.to respond_to(:remove_plane).with(1).argument }

    it 'a removed plane should current_location be in the landed_planes array' do
      plane = double(:plane)
      airport.store_plane(plane)
      airport.remove_plane(plane)
      expect(airport.landed_planes).not_to include plane
    end
  end

  describe '#full?' do
    it { is_expected.to respond_to(:full?) }

    it 'should respond true when airport is full' do
      15.times { airport.store_plane(double(:plane)) }
      expect(airport.full?).to eq(true)
    end

    it 'should respond false when airport is not full' do
      expect(airport.full?).to eq(false)
    end
  end

  describe 'capacity' do
    it 'should depend on initialization' do
      airport = Airport.new(capacity: 5)
      expect(airport.capacity).to eq 5
    end

    it 'should affect the result of #full?' do
      airport2 = Airport.new(capacity: 5)
      5.times {
        airport.store_plane(double(:plane))
        airport2.store_plane(double(:plane))
      }
      expect(airport.full?).to eq false
      expect(airport2.full?).to eq true
    end

    it 'should default to 15' do
      airport2 = Airport.new
      expect(airport2.capacity).to eq 15
    end
  end

  describe '#generate_weather' do
    it 'should return :stormy or :clear' do
      expect([:stormy, :clear]).to include(airport.generate_weather)
    end

    it 'should return different weather at different times' do
      srand 5
      expect(airport.generate_weather).to eq :stormy
      srand 0
      expect(airport.generate_weather).to eq :clear
    end
  end
end
