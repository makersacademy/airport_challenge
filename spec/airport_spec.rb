require 'airport'

describe Airport do

  it "allows to #land a plane in the airport" do
    expect(subject).to respond_to{:land}
  end

  it "allows a plane to #take_off" do
    expect(subject).to respond_to{:take_off}
  end

  it "confirms that a plane has take_off" do
    subject.land(Plane.new)
    expect{subject.take_off}.to output("Plane has taken off").to_stdout
  end

  it "raises error if #land and airport is over default capacity of 100 planes" do
    Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
    expect{subject.land(Plane.new)}.to raise_error("Airport is full")
  end

  it "raises an error if #take_off and there is no planes" do
    expect{subject.take_off}.to raise_error("Airport is empty")
  end
end
