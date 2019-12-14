require 'plane'

describe Plane do
  it 'a plane is airborne' do
    plane = Plane.new
    plane.airborne = true
    expect(plane.airborne).to eq true
  end 
end 