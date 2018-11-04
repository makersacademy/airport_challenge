require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it "set an initial capacity" do
    airport2 = Airport.new(30)
    expect(airport2.capacity).to eq(30)
  end

  it "set the default capacity to 10" do
    airport3 = Airport.new
    expect(airport3.capacity).to eq(10)
  end

  it "prevents landing if airport is full" do
    Airport::DEF_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land("Qantas") }.to raise_error "Airport is full"
  end

  it 'stores the plane in the hangar if landed' do
    gatwick = Airport.new
    gatwick.land("Boeing_747")
    expect(gatwick.hangar).to include "Boeing_747"
  end

end
