require 'plane'

describe Plane do
  it {is_expected.to respond_to(:broadcast_location)}
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}


  let(:airport) {double :airport}
  let(:airport2) {double :airport2}
  let(:crashed_plane) {double :crashed_plane, location: "a field", crashed?: true}


  describe "#broadcast_location" do
    it 'is expected to know where it is' do
      expect(subject.broadcast_location).to eq "where eagles soar"
    end
  end

  describe "#land" do
    it "planes land safely at airports" do
      expect(subject.land(airport)).to eq nil
      expect(subject.broadcast_location).to eq airport
      expect(subject).not_to be_flying
      expect(subject).not_to be_crashed
    end

    it "plane crash-lands if no location is provided" do
      expect(subject.land).to eq "Crash landing"
      expect(subject).not_to be_flying
    end

    it "some crash landings are safe" do
      allow(Plane).to receive(:rand).and_return(0)
      subject.land
      expect(subject).not_to be_crashed
      expect(subject.broadcast_location).to eq "a field"
    end

    it "some crash landings are not" do
      allow(Plane).to receive(:rand).and_return(1)
      subject.land
      expect(subject).to be_crashed
      expect(subject.broadcast_location).to eq "... ..."

    end


    it "only planes in the sky can land" do
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error("You yanking crank, I'm on the effin' tarmac")
    end

  end

  describe "#take_off" do
    it "location will be 'where eagles soar' whilst flying" do
      expect(subject.broadcast_location).to eq "where eagles soar"
      expect(subject.flying).to be_truthy
    end

    it "have a nil return value" do
      subject.land(airport)
      expect(subject.take_off(airport)).to eq nil
    end

    it "flying planes can't take off" do
      expect{subject.take_off(airport)}.to raise_error("I'm already up here mate")
    end

    it "can only take off from current location" do
      subject.land(airport)
      expect{subject.take_off(airport2)}.to raise_error("You frickin' loopy, I'm in #{airport}")
    end

    it "crashed planes can't take off" do
      allow(Plane).to receive(:rand).and_return(1)
      subject.land
      expect{subject.take_off("a field")}.to raise_error("This birds got no wings")
    end


  end
end
