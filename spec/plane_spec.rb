require 'plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

describe Plane do
  it {is_expected.to respond_to(:land)}
  it {is_expected.to respond_to(:take_off)}
  it {is_expected.to respond_to(:broadcast_location)}


  describe "#land" do
    it 'is expected to confirm that it has landed when it has landed' do
      expect(subject.land).to eq "That was a bumpy landing sir"
    end
  end

  describe "#take_off" do
    it 'is expected to confirm that it has left the airport' do
      expect(subject.take_off).to eq "I can see my house from here"
    end
  end

  describe "#broadcast_location" do
    it 'is expected to know where it is after it has landed' do
      subject.land
      expect(subject.broadcast_location).to eq "Airport"
    end

    it 'is expected to know where it is after it has taken off' do
      subject.take_off
      expect(subject.broadcast_location).to eq "Where eagles soar"
    end
  end
end
