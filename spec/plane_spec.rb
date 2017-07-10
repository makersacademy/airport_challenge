require "plane"

describe Plane do

  it "comfirms landing at the airport" do
    subject = Plane.new
    subject.landed?
    expect(subject.landed?).to eq true
  end

  it "confirms taking-off from airport" do
    subject = Plane.new
    subject.take_off?
    expect(subject.take_off?).to eq true
  end
=begin
  it "takes-off if weather is sunny" do
    subject = Plane.new
    Weather.new(sunny)
    subject.take_off?
    expect(subject.take_off?).to eq true
  end
=end
end
