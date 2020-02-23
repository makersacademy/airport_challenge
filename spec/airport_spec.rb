require 'airport'

describe Airport do

  it "allows to #land a plane in the airport" do
    expect(subject).to respond_to(:land)
  end

  it "allows a plane to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "confirms that a plane has take_off" do
    allow(subject).to receive(:storm?) { false } # overrides storm true
    subject.land(Plane.new)
    expect { subject.take_off }.to output("Plane has taken off").to_stdout
  end

  it "raises error if #land and airport is over default capacity of 100 planes" do
    allow(subject).to receive(:storm?) { false }

    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Airport is full")
  end

  it "raises an error if #take_off and there is no planes" do
    allow(subject).to receive(:storm?) { false }
    expect { subject.take_off }.to raise_error("Airport is empty")
  end

  it "creates a storm randomly" do
    expect(subject).to receive(:rand).and_return(7)
    expect(subject.storm?).to eq true
  end

  it "raises an error if #take_off and #storm" do
    allow(subject).to receive(:empty?) { false }
    allow(subject).to receive(:storm?) { true }
    expect { subject.take_off }.to raise_error("There is a storm")
  end

  it "raises an error if #land and #storm" do
    allow(subject).to receive(:full?) { false }
    allow(subject).to receive(:storm?) { true }
    expect { subject.land(Plane.new) }.to raise_error("There is a storm")
  end
end
