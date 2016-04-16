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
    allow(weather).to receive(:stormy?).and_return(true)
    airport = described_class.new(weather)

    airport.land_plane plane
    allow(plane).to receive(:flying).and_return(false)
    expect{airport.take_off(plane)}.to raise_error('Too stormy for take-off')
  end

end
