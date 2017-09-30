require 'plane'

describe Plane do
  let(:airport) { double(:airport) }
   
  it "should be able to land at an airport" do
    expect(subject.land_at(airport)).to eq airport # Airport.new
  end
  
  it "should confirm that is no longer at the airport after take off" do
    subject.take_off
    expect(subject.at_the_airport?).to eq false
  end

end
