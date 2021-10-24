require 'airport'

describe Airport do
  it "instructs a plane to land" do
    expect(subject).to respond_to :land
  end

  it "instructs a plane to take_off" do
    expect(subject).to respond_to :take_off
  end

  it "creates an example of plane when a plane lands" do
    expect(subject).to respond_to(:land).with(1).argument
  end
end