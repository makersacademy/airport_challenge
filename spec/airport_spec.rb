require 'airport'
require 'weather'
require 'plane'

describe Airport do 

  it ' hould have a default capacity of 50' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should respond to landing' do
    plane = Plane.new
    expect(subject).to respond_to(:land)
  end

  it 'should respond to takeoff' do
    expect(subject).to respond_to(:take_off)
  end

  it 'should remove the plane once we take off' do
    srand(3)
    plane = Plane.new
    h = Airport.new
    h.land(plane)
    h.take_off(plane)
    expect(h.plane_list).to eq []
  end

  describe "checking stormy requirements" do
    

    it 'should give runtime error when landing and its stormy' do
      srand(23)
      plane = Plane.new
      h = Airport.new
      expect { h.land(plane) }.to raise_error 'Dangerous Weather'

    end

  end

  

end
