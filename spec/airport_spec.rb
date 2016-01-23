require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  describe '#land' do
    let(:plane) {double(:plane)}
    let(:weather) {double("weather", :stormy? => nil)}

    it {is_expected.to respond_to(:land).with(2).argument}

    it 'lands the plane at the airport' do
      expect(airport.land(plane, weather)).to include plane
    end

    it 'expects not to let planes land if the airport is at full capacity' do
    airport.set_capacity.times {airport.land(plane, weather)}
    expect {airport.land(plane, weather)}.to raise_error "The airport is full!"
    end

  end

  describe '#takeoff' do
    let(:plane) {double(:plane)}
    let(:weather) {double("weather", :stormy? => nil)}

    it {is_expected.to respond_to(:takeoff).with(2).arguments}

    it 'removes the plane from the airport' do
      airport.land(plane, weather)
      airport.takeoff(plane, weather)
      expect(airport.planes_in_airport).not_to include(plane)
    end

  end

  describe 'stormy weather' do
    let(:plane) {double(:plane)}
    let(:weather) {double("weather", :stormy? => true)}

    it 'does not land planes when the weather is stormy' do
    expect {(airport.land(plane, weather))}.to raise_error("Too stormy to land planes!")
    end

    it 'does not let planes takeoff when the weather is stormy' do
    expect {(airport.takeoff(plane, weather))}.to raise_error("Too stormy to let planes takeoff!")
    end

  end



end
