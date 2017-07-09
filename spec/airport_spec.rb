require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land) }
  it {is_expected.to respond_to(:capacity) }

  it "confirms that a plane is taking off" do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end

  it "confirms that a plane has landed" do
    airport.take_off(plane)
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it "should raise an error if airport is full" do
    20.times { airport.land(plane) }
    expect {airport.land(plane)}.to raise_error "Airport full!"
  end

end
