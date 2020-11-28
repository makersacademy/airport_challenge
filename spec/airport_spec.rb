require "airport"

describe Airport do
  subject {Airport.new(5)}
  it "can create an instance of Airport and assign to new variable" do
    expect(subject).to be_kind_of(Airport)
  end

  it "can respond to arrival" do
    expect(subject).to respond_to(:arrival).with(1).argument
  end

  it "can respond to depart" do
    expect(subject).to respond_to(:depart).with(1).argument
  end

  it "can respond to hangar" do
    expect(subject).to respond_to(:hangar)
  end

  it "hangar should have an initial inventory of no planes" do
    expect(subject.hangar).to eq([])
  end

  it "when a plane arrives in airport, a plane is added to the hangar" do
    subject.arrival("airbus_516")
    expect(subject.hangar).to eq(["airbus_516"])
  end

  it "when a plane departs the airport, a plane is removed from the hangar" do
    subject.arrival("airbus_516")
    subject.depart("airbus_516")
    expect(subject.hangar).to eq([])
  end

  it "the hangar can take a capacity of three planes" do
    3.times { subject.arrival("plane") }
    expect(subject.hangar).to eq(["plane", "plane", "plane"])
  end

  it "the hangar can take a capacity of five planes" do
    5.times { subject.arrival("plane") }
    expect(subject.hangar).to eq(["plane", "plane", "plane", "plane", "plane"])
  end

  it "the hangar will raise and error when six planes are added" do
    expect { 6.times { subject.arrival("p") } }.to raise_error(RuntimeError)
  end

  it "edge case test: the hangar will raise and error when one thousand planes are added" do
    expect { 1000.times { subject.arrival("p") } }.to raise_error(RuntimeError)
  end

  it "airport takes an argument to specify hangar capacity" do
    expect { 11.times { subject.arrival("p") } }.to raise_error(RuntimeError)
  end

describe Airport
  airport = Airport.new(2)

  it "test 1: throws error if over hangar capacity" do
    expect { 9.times { airport.arrival("p") } }.to raise_error(RuntimeError)
  end

  it "test 2: throws error if over hangar capacity" do
    expect { 11.times { airport.arrival("p") } }.to raise_error(RuntimeError)
  end

  it "test 3 (edge case): throws error if over hangar capacity" do
    expect { 999.times { airport.arrival("p") } }.to raise_error(RuntimeError)
  end

  it "test 4: should allow two planes to dock as meets capacity" do
    2.times { subject.arrival("plane") }
    expect(subject.hangar).to eq( ["plane", "plane"])
  end

end