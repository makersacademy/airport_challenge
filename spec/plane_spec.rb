require 'plane'

  describe Plane do

    # let(:plane) { double()}

    it { is_expected.to respond_to(:lands) }
    it { is_expected.to respond_to(:takes_off) }
    it { is_expected.to respond_to(:update_location) }

    it "check #lands raises error if plane on ground" do
      expect {subject.lands}.to raise_error "The plane is already on the ground"
    end

    it "check #lands raises error until Airport instructs it do so" do
      subject.update_location('in transit')
      subject.takes_off
      expect {subject.lands}.to raise_error "Only Airports can tell Planes to land"
    end

    it "a successful #lands changes in_flight to false" do
      subject.update_location('in transit')
      subject.takes_off
      subject.update_location('not in transit')
      subject.lands
      expect(subject.in_flight).to eq false
    end

    it "#takes_off raises an error until Airport instructs it do so" do
      expect {subject.takes_off}.to raise_error "Only Airports can tell Planes to take off"
    end

    it "#takes_off raises an error if plane is already flying" do
      subject.update_location('in transit')
      subject.takes_off
      expect {subject.takes_off}.to raise_error "The plane is already flying"
    end

    it "a successful #takes_off changes in_flight to true" do
      subject.update_location('in transit')
      subject.takes_off
      expect(subject.in_flight).to eq true
    end

    it "check #update_location changes location" do
      subject.update_location('New Location')
      expect(subject.location).to eq 'New Location'
    end

  end
