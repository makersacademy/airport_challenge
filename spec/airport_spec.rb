require 'airport'

describe Airport do
  it "should create a new instance" do
    expect(subject).to be_a Airport
  end

  it "should instruct a plane to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
