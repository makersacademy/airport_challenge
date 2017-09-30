require 'plane'

describe Plane do
  let(:airport) { double(:airport) }
   
  it "should be able to land at an airport" do
    expect(subject.land_at(airport)).to eq airport # Airport.new
  end

end

