require './lib/airport'
require './lib/plane'

describe Airport do
  it "runs an instance of an airport" do
    subject = Airport.new
    expect(subject).to be_instance_of(Airport)
  end

  it "lands a plane on arrival" do
    expect(subject).to respond_to(:land)
  end

  it "lets a plane take off from the airport" do
    expect(subject).to respond_to(:depart)
  end
end
