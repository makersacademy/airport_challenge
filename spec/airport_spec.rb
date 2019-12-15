require "airport"

describe Airport do
  it "expects Airport to make working airports" do
    airport = Airport.new
    expect(airport).to eq airport
  end

  it "airport to land a plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "airport to take_off a plane" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
