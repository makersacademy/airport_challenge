require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  describe '#land' do
    let(:plane) {double(:plane)}
    let(:weather) {double("weather", :stormy? => nil)}

    it 'lands the plane at the airport' do
      expect(airport.land(plane, weather)).to include plane
    end

    it 'expects not to let planes land if the airport is at full capacity' do
      airport.set_capacity.times do
        plane = double(:plane)
        airport.land(plane, weather)
      end
      message = "The airport is full!"
      expect {airport.land(plane, weather)}.to raise_error(message)
    end

  end

  describe '#set_capacity' do

    it 'expects a capacity to be set' do
      random = rand(1..60)
      expect(airport.set_capacity(random)).to eq(random)
    end

    it 'expects DEFAULT_CAPACITY to be set if no capacity specified' do
      expect(airport.set_capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

  end

  describe '#takeoff' do
    let(:plane) {double(:plane)}
    let(:weather) {double("weather", :stormy? => nil)}
    before {airport.land(plane, weather)}


    it 'removes the plane from the airport' do
      airport.takeoff(plane, weather)
      expect(airport.planes_in_airport).not_to include(plane)
    end

    # it removes the plane from the airport when there are multiple planes

  end

  context 'stormy weather' do
    let(:plane) {double(:plane)}
    let(:weather) {double("weather", :stormy? => true)}

    it 'does not land planes when the weather is stormy' do
      message = "Too stormy to land!"
      expect {(airport.land(plane, weather))}.to raise_error(message)
    end

    it 'does not let planes takeoff when the weather is stormy' do
      airport.add_plane(plane)
      message = "Too stormy to takeoff!"
      expect {airport.takeoff(plane, weather)}.to raise_error(message)
    end

  end




end
