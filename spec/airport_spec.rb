require 'airport'

describe Airport do
  let(:plane){double :plane, landed?: true}
  let(:weather){double :weather, stormy?: false}
  subject(:airport){ described_class.new(weather) }
  it {is_expected.to respond_to :land_plane}
  it {is_expected.to respond_to :take_off}

  it "lands a plane" do
    airport.land_plane(plane)
    expect(airport.planes).to include plane
  end

  it "has a plane take off" do
    airport.land_plane plane
    allow(plane).to receive(:flying).and_return(false)
    expect(airport.take_off(plane)).to eq plane
  end

  it "denies take off during stormy weather" do
    airport.land_plane plane
    allow(weather).to receive(:stormy?).and_return(true)
    allow(plane).to receive(:flying).and_return(false)
    expect{airport.take_off(plane)}.to raise_error('Too stormy for take-off')
  end

  it "denies landing during stormy weather" do
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.land_plane(plane)}.to raise_error('Too stormy for landing')
  end

  it "denies landing when airport is full" do
    20.times { |x| airport.land_plane plane}
    expect{airport.land_plane plane}.to raise_error"Airport full"
  end

  it "will take different values for capacity" do
    array = (1..10).to_a
    array.each do |x|
      airport = Airport.new weather, x
      x.times {|x|airport.land_plane plane}
      expect{airport.land_plane plane}.to raise_error"Airport full"
    end
  end

end
