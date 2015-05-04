# Unit tests (airports):

# - Can prevent a plane from take-off if weather not 'sunny'
# - Can prevent a plane from land if weather not 'sunny'
# - Can provide 'sunny' or 'stormy' weather update
# - Knows if a plane is in air
# - or at airport

require 'airport'

describe Airport do

  context 'taking off and landing' do

    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to :takeoff }

    it 'has one plane after landing' do
      plane = double :plane
      allow(plane).to receive(:land) { 'landed' }
      airport = Airport.new
      airport.land plane
      expect(airport.hangar.count).to eq 1
    end
  end
  # it 'allows a plane to take-off' do
  #   plane = double :plane
  #   allow(plane).to receive(:takeoff) { 'flying' }
  #   airport = Airport.new
  #   airport.takeoff plane
  # end

  context 'traffic control' do

    it 'raises an error when full' do
      6.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end

    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

  # context 'weather conditions' do
  #   it 'a plane cannot take off when there is a storm brewing' do
  #     airport = Airport.new
  #     subject.takeoff plane
  #     allow(airport).to receive(:weather) { 'landed' }
  #   end
  # end

  #     xit 'a plane cannot land in the middle of a storm'
  # end
end