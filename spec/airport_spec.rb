require 'airport'

describe Airport do
  it { is_expected.to respond_to(:takeoff) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:planes) }

  describe 'To be used for many different airports, ' do
    it "allows user to override a default capacity" do
      airport = Airport.new(30)
      30.times{ airport.land double(:plane) }
      expect { airport.land double(:plane)}.to raise_error('Airport is full. Not allowed to land.')
    end
  end

end
