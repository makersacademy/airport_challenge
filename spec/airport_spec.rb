require 'airport'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}

  let(:plane) {double :plane}

  describe "#land" do
    it 'is expected to confirm that a plane has landed after it has been instructed to land' do
      expect(subject.land(plane)).to eq "That was a bumpy landing sir"
    end
  end
  #
  describe "#take_off" do
    it 'is expected to confirm that a plane has left the airport' do
      expect(subject.take_off(plane)).to eq "Don't forget to send a postcard"
    end
  end

end
