require "airport"

describe Plane do
  it "lands at an airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "landed variable reads true after plane has landed" do
    airport = Airport.new
    airport.instance_variable_set(:@full, false)
    subject.land(airport)
    expect(subject.landed).to eq true
  end
  it "can't land once it has already landed" do
    airport = Airport.new
    airport.instance_variable_set(:@full, false)
    subject.instance_variable_set(:@landed, true)
    expect{subject.land(airport)}.to raise_exception("The plane has already landed")
  end
  it "can't land if the weather is stormy" do
    subject.instance_variable_set(:@stormy, true)
    expect{subject.land(Airport.new)}.to raise_exception "The plane can't land in this weather"
  end
  it "takes off from an airport" do
    expect(subject).to respond_to(:take_off)
  end
  it "only takes off when it is currently at an airport" do
    subject.instance_variable_set(:@landed, false)
    expect{subject.take_off}.to raise_exception("The plane is already in the air")
  end
  it "can't take off if the weather is stormy" do
    subject.instance_variable_set(:@stormy, true)
    subject.instance_variable_set(:@landed, true)
    expect{subject.take_off}.to raise_exception("The plane cannot take off in this weather")
  end
  it "can't land at a full airport" do
    airport = Airport.new
    airport.instance_variable_set(:@full, true)
    expect{subject.land(airport)}.to raise_exception("The plane can't land at a full airport")
  end
end
