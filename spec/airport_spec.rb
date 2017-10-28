require 'airport'

describe Airport do
  subject { Airport.new }

  it "should create a new airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "should respond to #land" do
    expect(subject).to respond_to(:land)
  end
end
