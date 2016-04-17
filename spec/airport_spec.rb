require "airport"
describe Airport do
  it { expect(subject).to respond_to :stormy? }
  it { expect(subject).to respond_to(:accept, :release).with(1).argument }

  let(:flying_plane) { double(:plane, flying?: true, land: false, take_off: true) }
  let(:grounded_plane) { double(:plane, flying?: false, land: false, take_off: true) }

  it "should be initialized with @planes as empty" do
    expect(subject.instance_variable_get(:@planes)).to be_empty
  end
  it "should be initialized with a default capacity" do
    expect(subject.instance_variable_get(:@capacity)).to eq Airport::Default_Capacity
  end

  describe "#accept" do
    it "should check the weather" do
      expect(subject).to receive :stormy?
      subject.accept flying_plane
    end
    it "should check if the airport is full" do
      allow(subject).to receive(:stormy?) { false }
      expect(subject).to receive :full?
      subject.accept flying_plane
    end
    it "should check if the plane is flying" do
      allow(subject).to receive(:stormy?) { false }
      expect(flying_plane).to receive :flying?
      subject.accept flying_plane
    end
    it "should add the object to @planes" do
      allow(subject).to receive(:stormy?) { false }
      subject.accept flying_plane
      expect(subject.instance_variable_get(:@planes)).to include flying_plane
    end
    it "should tell the plane to land if the plane is flying" do
      allow(subject).to receive(:stormy?) { false }
      expect(flying_plane).to receive :land
      subject.accept flying_plane
    end
    it "should raise an error if the plane is already grounded" do
      expect { subject.accept grounded_plane }.to raise_error Airport::AcceptErr
    end
    it "should raise an error if the weather is stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.accept flying_plane }.to raise_error Airport::StormErr
    end
    it "should raise an error if the airport is full" do
      subject.instance_variable_set(:@planes, [grounded_plane])
      allow(subject).to receive(:stormy?) { false }
      expect { subject.accept flying_plane }.to raise_error Airport::CapacityErr
    end
  end

  describe "#release" do
    # it "should check if the plane is in the airport" do
    #   subject.instance_variable_set(:@planes, [grounded_plane])
    #   expect(subject).to receive :plane_in_airport?
    #   subject.release grounded_plane
    # end
    it "should check the weather" do
      subject.instance_variable_set(:@planes, [grounded_plane])
      expect(subject).to receive :stormy?
      subject.release grounded_plane
    end
    it "should remove the object from @planes" do
      subject.instance_variable_set(:@planes, [grounded_plane])
      allow(subject).to receive(:stormy?) { false }
      subject.release grounded_plane
      expect(subject.instance_variable_get(:@planes)).not_to include grounded_plane
    end
    it "should tell the plane to take off if it is at the airport" do
      subject.instance_variable_set(:@planes, [grounded_plane])
      allow(subject).to receive(:stormy?) { false }
      expect(grounded_plane).to receive :take_off
      subject.release grounded_plane
    end
    it "should raise an error if the plane is not at the airport" do
      expect { subject.release flying_plane }.to raise_error Airport::ReleaseErr
    end
    it "should raise an error if the weather is stormy" do
      subject.instance_variable_set(:@planes, [grounded_plane])
      allow(subject).to receive(:stormy?) { true }
      expect { subject.release grounded_plane }.to raise_error Airport::StormErr
    end
  end
end
