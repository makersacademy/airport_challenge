require "airport"
require "plane"

describe Airport do 

  before(:each) do
    @airport = Airport.new
    allow(@airport).to receive(:stormy?).and_return(false)
  end

  it "full if add planes to capacity" do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land(@airport) }
    expect(@airport).to be_full
  end

  it "prevents landing when full" do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land(@airport) }
    expect { Plane.new.land(@airport) }.to raise_error "Unable to land; airport at capacity"
  end

end
