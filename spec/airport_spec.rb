require "airport"

describe Airport do
  subject(:airport) {described_class.new}

  #1
  it "checks existance of the class Airport" do
    expect(airport.class).to eq Airport
  end

  #2
  it "plane can land at airport - land method" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  #3
  it "a plane can depart from the airpot - take_off method" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end



end
