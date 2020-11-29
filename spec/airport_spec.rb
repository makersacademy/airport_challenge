require './lib/airport'

describe Airport do
  it "runs an instance of an airport" do
    subject = Airport.new
    expect(subject).to be_instance_of(Airport)
  end
end
