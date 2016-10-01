require "airport"

describe Airport do
  subject(:airport) {described_class.new}

  #1
  it "1. checks existance of the class Airport" do
    expect(airport.class).to eq Airport
  end

  #2
  it "2. plane can land at airport - land method" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  #3
  it "3. a plane can depart from the airpot - take_off method" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  #4
  # it "4. raises an error for take_off if weather is stormy" do
  #   plane = Plane.new
  #   airpot.land
  # end


end
