require "airport.rb"

describe Airport do

  it "should have a default capacity set" do
    airport = Airport.new
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should have a default capacity that can be reset" do
    airport = Airport.new(250)
    expect(airport.airport_capacity(250)).to eq 250
  end

  # it "should raie an error when wanting to land a plane when airport is at full capacity" do
  #  expect { subject.land }.to raise_error 'cannot land plane'
  #  end
end
