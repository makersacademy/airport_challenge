require 'airport'

describe Airport do
  it "airport should have a default capacity that can be overridden as appropriate" do
    expect(subject.capacity).to eq 10 
    expect(Airport.new(20).capacity).to eq 20

  end
end