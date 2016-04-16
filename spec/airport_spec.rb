require 'airport'

describe Airport do
  let(:plane){double :plane, landed?: true}
  let(:weather){double :weather, stormy?: false}
  subject(:airport){ described_class.new(weather) }
  it {is_expected.to respond_to :land_plane}
  it {is_expected.to respond_to :take_off}

  it "lands a plane" do
    subject.land_plane(plane)
    expect(subject.planes).to include plane
  end

  it "has a plane take off" do
    subject.land_plane plane
    allow(plane).to receive(:flying).and_return(false)
    expect(airport.take_off(plane)).to eq plane
  end

  it "denies take off during stormy weather" do
    airport = described_class.new(weather)
    airport.land_plane plane
    allow(weather).to receive(:stormy?).and_return(true)
    allow(plane).to receive(:flying).and_return(false)
    expect{airport.take_off(plane)}.to raise_error('Too stormy for take-off')
  end

  it "denies landing during stormy weather" do
    airport = described_class.new(weather)
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.land_plane(plane)}.to raise_error('Too stormy for landing')
  end

end
