require 'plane'

describe Plane do 
  it 'Create a plane' do
    plane = Plane.new("Boeing", "Paris", "London", "Flying")
    expect(plane.model).to eq "Boeing"
    expect(plane.origin).to eq "Paris"
    expect(plane.destination).to eq "London"
    expect(plane.flight_status).to eq "Flying"
  end
end