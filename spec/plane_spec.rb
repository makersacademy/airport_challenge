require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  it 'is flying when created' do
    plane = Plane.new
    expect(plane.flying?).to eql(true)
  end

  describe 'landing' do

    it 'should take one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'can land' do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      expect(plane.flying?).to eql(false)
    end
  end

  it 'can take off' do
    plane = Plane.new
    plane.land
    plane.take_off
    expect(plane.flying?).to eql(true)
  end

  it 'flying plane cannot take_off' do
    plane = Plane.new
    expect{plane.take_off}.to raise_error "This plane is already airbourne"
  end

  it 'landed plane cannot land' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect{plane.land(airport)}.to raise_error "This plane has already landed"
  end

end
