require "airport"

describe Airport do
  it "will respond to full method" do
    expect(subject).to respond_to(:full?)
  end
  it "initialise airport with 1 plane " do
    expect(subject.capacity).to eq(1)
  end

  # airplane  = Airplane.new
  # airlane.depart?
  # it "will initialize airport with capacity of 1"
  # airport = Airport.new(1)
  # airport.instance_variable_set(:@planes, 1)
end
#
#
#
