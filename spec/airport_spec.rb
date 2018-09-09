require 'airport'

describe Airport do
  it "has no planes inside" do
    expect(subject.planes).to eq []
  end
  it "can update planes" do
    subject.planes = ["Plane 1"]
    expect(subject.planes). to eq ["Plane 1"]
  end
  it "system designer is able to set the capacity when created" do
    airport = Airport.new(capacity = 5)
    expect(airport.capacity).to eq 5
  end
  it "system designer is able to set modify capacity of an already created airport" do
    airport = Airport.new
    expect(airport.modify_capacity(12)).to eq 12
  end
end
