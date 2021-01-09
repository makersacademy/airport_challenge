require "airport"
require "plane"

describe Airport do 

  it "full if add planes to capacity" do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land(subject) }
    expect(subject).to be_full
  end

  it "prevents landing when full" do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land(subject) }
    expect { Plane.new.land(subject) }.to raise_error "Unable to land; airport at capacity"
  end

  it "stormy?" do
    expect(subject.stormy?).not_to be_nil
  end

end
