require 'plane.rb'

describe Plane do
  it 'checks that Plane class exists' do
    expect(Plane.new).to be_instance_of Plane
  end
  it 'checks that #land method exists' do
    expect(Plane.new).to respond_to :land
  end
  it 'checks that plane has landed at given airport' do
    airport = Airport.new
    plane = Plane.new
    expect { plane.land(airport) }.to output("The plane has landed at #{airport}").to_stdout
  end
end
