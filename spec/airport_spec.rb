require 'airport'
require 'aeroplane'

describe Airport do

  it "checks if the airport is full and prevents landing if full" do
    plane = Aeroplane.new
    expect {1.times {subject.land(plane)} }.to raise_error("airport is full, this plane cannot land")
  end
  
end