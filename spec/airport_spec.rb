require "airport"

describe Airport do
  subject { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should be able to land a plane" do
    expect(subject.land(plane)).to eq([plane])
  end

  it "should return an error if there is no more space for new planes to land" do
    described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Hangar is full, can't land"
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  it "should delete a plane after takeoff" do
    expect(subject.take_off(plane)).to be nil
  end

  context "Checks for weather restrictions" do

    it "stops a plane from landing if weather is not sunny" do
      allow(subject).to receive(:sunny?).and_return(false)
      expect { subject.land(plane) }.to raise_error "Permission to land denied"
    end

    it "stops a plane from departing if weather is not sunny" do
      allow(subject).to receive(:sunny?).and_return(false)
      expect { subject.take_off(plane) }.to raise_error "Permission to depart denied"
    end
  end
end


