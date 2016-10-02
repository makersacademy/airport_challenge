require 'airport'
describe Airport do
  it { is_expected.to respond_to :weather }
  it { is_expected.to respond_to(:land).with(1).argument }

  describe "initialization" do
    it "defaults capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "can be set a different capacity" do
      expect(Airport.new(100).capacity).to eq 100
    end
    it "should have no planes at start" do
      expect(subject.planes).to eq []
    end
  end

  let(:new_plane) { double(:plane, landed?: nil, set_airport: subject) }

  describe "#land" do

    it "should raise error when airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(new_plane) }
      expect { subject.land(new_plane) }.to raise_error "Airport is full!"
    end

    it "should not land an already landed plane" do
      allow(new_plane).to receive(:landed?).and_return(true)
      expect { subject.land(new_plane) }.to raise_error "Plane already landed!"
    end

    it "should not land if weather is stormy" do
      allow(new_plane).to receive(:landed?).and_return(false)
      allow(subject).to receive(:weather).and_return(:stormy)
      expect { subject.land(new_plane) }.to raise_error "Plane took off, but cannot land! Weather is stormy! Try landing at other airport"
    end
  end

  describe "#take_off" do
    before { subject.land(new_plane) }

    it "should remove plane from the airport" do
      subject.send(:take_off, new_plane, described_class.new)
      expect(subject.planes).not_to include new_plane
    end
  end

end
