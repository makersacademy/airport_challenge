require "airport"
require "plane"

describe Airport do 

  it "prevents landing when full" do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land(subject) }
    expect { Plane.new.land(subject) }.to raise_error "Unable to land; airport at capacity"
  end
end
