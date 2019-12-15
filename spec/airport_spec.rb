require 'airport'

describe Airport do
  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "doesn not let planes land when stormy" do
    plane = double :plane
    allow(plane).to receive(:stormy?).and_return(true)
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error "Can't land, stormy"
  end
  describe 'plane' do
    it "returns landed planes" do
      expect(subject.plane).to eq @planes
    end
  end

  it { is_expected.to respond_to :send_plane }

  describe 'lands' do
    it "lands a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it "raises an error when airport is full" do
      subject.capacity.times do
        subject.land double :planes
      end
      expect { subject.land double :planes }.to raise_error "Full capacity"
    end
  end
  
  describe '#send_plane' do
    it "sends plane currently on the ground flying" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.send_plane).to eq plane
    end

    it "raises an error when no planes are in airport" do
      expect { subject.send_plane }.to raise_error "No planes"
    end
  end
end
