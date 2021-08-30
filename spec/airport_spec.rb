require "airport"

describe Airport do

  let(:planes) { double :planes }
  let(:weather) { double :weather }
  let(:plane) { double :plane }
  let(:plane2) { double :plane }
  subject(:airport) { described_class.new(weather) }

  it { is_expected.to be_instance_of(Airport) }

  context "responds to" do

    it { is_expected.to respond_to(:land).with(1).argument }

    it { is_expected.to respond_to(:take_off).with(1).argument }
  end

  context "with good weather" do
    before { allow(weather).to receive(:sunny?).and_return(true) }
    
    it "should allow a plane to land" do
      expect(subject.land(plane)).to eq([plane])
    end

    it "should return an error if there is no more space for new planes to land" do
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new true) }
      expect { subject.land(plane) }.to raise_error "Hangar is full, can't land"
    end

    it "should return an error if a plane that is already landed tries to land again" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "This plane has already landed"
    end

    it "should allow a plane to takeoff" do
      subject.planes << plane
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end

    it "should remove a plane from the array after takeoff" do
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "should raise an error if there are no planes and we try to take-off" do
      expect { subject.take_off(plane) }.to raise_error "Hangar is empty, no planes to fly"
    end
  end

  context "with bad weather" do
    before { allow(weather).to receive(:sunny?).and_return(false) }
  
    it "shouldn't allow a plane to land" do
      expect { subject.land(plane) }.to raise_error "Permission to land denied"
    end

    it "shouldn't allow a plane to take-off" do
      subject.planes << plane
      expect { subject.take_off(plane) }.to raise_error "Permission to depart denied"
    end
  end

  # context "if plane is not flying" do
  #   plane = Plane.new(false)
  #   it "should not let the plane land" do
  #     p "plane -> #{plane}"
  #   end
  # end  
end
