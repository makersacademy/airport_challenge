require 'plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

describe Plane do
  it {is_expected.to respond_to(:broadcast_location)}
  it {is_expected.to respond_to(:land)}
  it {is_expected.to respond_to(:take_off)}


  describe "#broadcast_location" do
    it 'is expected to know where it is' do
      expect(subject.broadcast_location).to eq "Airplane factory"
    end
  end

  describe "#land" do
    it "location will be 'airport' after landing" do
      subject.land
      expect(subject.broadcast_location).to eq "airport"
    end

    it "have a nil return value" do
      expect(subject.land).to eq nil
    end
  end

  describe "#take_off" do
    it "location will be 'where eagles soar' after landing" do
      subject.take_off
      expect(subject.broadcast_location).to eq "where eagles soar"
    end

    it "have a nil return value" do
      expect(subject.take_off).to eq nil
    end
  end
end
