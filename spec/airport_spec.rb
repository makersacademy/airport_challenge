require "airport"

describe Airport do

  let(:planes) { double :planes }
  let(:weather) { double :weather }
  let(:plane) { double :plane }
  let(:plane2) { double :plane }
  subject(:airport) { described_class.new(weather) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should be able to land a plane" do
    allow(weather).to receive(:sunny?).and_return(true)
    expect(subject.land(plane)).to eq([plane])
  end

  it "shouldn't be able to land a plane" do
    allow(weather).to receive(:sunny?).and_return(false)
    expect { subject.land(plane) }.to raise_error "Permission to land denied"
  end

  it "should return an error if there is no more space for new planes to land" do
    allow(weather).to receive(:sunny?).and_return(true)
    described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Hangar is full, can't land"
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  it "should delete a plane after takeoff" do
    allow(weather).to receive(:sunny?).and_return(true)
    subject.land(plane)
    subject.land(plane2)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "stops a plane from departing if weather is not sunny" do
    allow(weather).to receive(:sunny?).and_return(false)
    expect { subject.take_off(plane) }.to raise_error "Permission to depart denied"
  end
  # end
end
