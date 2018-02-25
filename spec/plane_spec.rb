require 'plane'

describe Plane do
  it { is_expected.to respond_to :left_airport?, :landing, :takeoff }

  describe '#landing' do
    it 'gives permission to land' do
      airport = double(:airport)
      expects(airport.land(subject)).to eq plane
    end
  end
end
