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
      airport.store_plane(double(:plane))

    end
  end

  it 'should remove a plane after it takes off' do
    plane = double(:plane)
    airport.remove_plane(plane)
    expect(airport.landed_planes).not_to include(plane)
  end

  # Tests for capacity:
  # * Raises an error if occupation > capacity
  # * Capacity changeable
  # * #full? works with changing capacity.
  # * Default capacity = 15
end
