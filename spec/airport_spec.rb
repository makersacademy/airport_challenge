require_relative "../lib/airport.rb"

describe Airport do

  it "capacity has a default of 50." do
    expect(subject.capacity).to eq 50
  end

  it "capacity can be overriden as appropiate. Given capacity of 20." do
    expect(Airport.new(nil, 20).capacity).to eq 20
    puts
  end

end
