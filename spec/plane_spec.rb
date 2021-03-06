require 'plane'

describe Plane do
  # default values shown for clairty.
  let(:plane) { Plane.new('concord', 'air') }
  let(:airport) { Airport.new('heathrow', []) }

  it 'responds to land' do
    is_expected.to respond_to :land
  end

  describe 'land' do
    it 'instructs a plane to land at an airport' do

    end
  end

  describe 'take_off' do
    it 'instructs a plane to take off from an airport and confirms no longer in the airport' do
      plane.location = airport
      plane.take_off
      expect(plane.location).to eq('air')
    end
  end
end
