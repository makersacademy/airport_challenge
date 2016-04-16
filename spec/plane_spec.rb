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
      subject.take_off
      subject.land
      expect(subject.broadcast_location).to eq "airport"
      expect(subject.flying).to be_falsey
    end

    it "have a nil return value" do
      subject.take_off
      expect(subject.land).to eq nil
    end

    it "only planes in the sky can land" do
      expect{subject.land}.to raise_error("I haven't taken off yet mate")
    end

  end

  describe "#take_off" do
    it "location will be 'where eagles soar' after landing" do
      subject.take_off
      expect(subject.broadcast_location).to eq "where eagles soar"
      expect(subject.flying).to be_truthy
    end

    it "have a nil return value" do
      expect(subject.take_off).to eq nil
    end

    it "flying planes can't take off" do
      subject.take_off
      expect{subject.take_off}.to raise_error("I'm already up here mate")
    end
  end
end
