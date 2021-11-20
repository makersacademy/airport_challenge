require 'plane'

describe Plane do 
  it 'Has a method to create a plane' do
      plane = Plane.new("Boeing", "London", "Paris", "Flying")
      expect(plane.model).to eq "Boeing"
      expect(plane.origin).to eq "London"
      expect(plane.destination).to eq "Paris"
      expect(plane.flight_status).to eq "Flying"
  end

  it 'Has a method to land the plane' do
    plane = Plane.new("Boeing", "London", "Paris", "Flying")
    expect(plane.land(plane)).to be_an_instance_of Array
  end

end