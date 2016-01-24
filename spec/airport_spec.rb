require 'airport'
require 'support/shared_examples_for_takeoff_land.rb'

describe Airport do
  it_behaves_like TakeoffLand
  subject(:airport) {described_class.new}

  describe '#land' do
    let(:plane) {double(:plane)}
    let(:weather) {double("weather", :stormy? => nil)}

    it 'lands the plane at the airport' do
      expect(airport.land(plane, weather)).to include plane
    end

    it 'expects not to let planes land if the airport is at full capacity' do
    airport.set_capacity.times {airport.land(plane, weather)}
    expect {airport.land(plane, weather)}.to raise_error "The airport is full!"
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

    it {is_expected.to respond_to(:takeoff).with(2).arguments}

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
    expect {(airport.land(plane, weather))}.to raise_error("Too stormy to land!")
    end

    it 'does not let planes takeoff when the weather is stormy' do
    expect {(airport.takeoff(plane, weather))}.to raise_error("Too stormy to takeoff!")
    end

  end



end
