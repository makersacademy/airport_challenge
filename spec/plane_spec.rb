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

  it { is_expected.to respond_to :flying }

  it 'is flying when created' do
    plane = Plane.new
    expect(plane.flying).to eql "flying"
  end


  it { is_expected.to respond_to :land }

  it 'is landed after landing' do
    plane = Plane.new(destination = "Glasgow")
    plane.land
    expect(plane.flying).to eql "landed"
  end


  it { is_expected.to respond_to :take_off }


  it 'is flying after take off' do
    plane = Plane.new(destination = "Glasgow")
    plane.land
    plane.take_off
    expect(plane.flying).to eql "flying"
  end

  describe '#land' do
    it 'raises an error if you request a landed plane to land' do
      plane = Plane.new
      plane.land
      expect { plane.land }.to raise_error 'already landed'
    end
  end

  describe '#take_off' do
    it 'raises an error if you ask a flying plane to take off' do
      plane = Plane.new
      expect { plane.take_off }.to raise_error 'already flying'
    end
    it { is_expected.to respond_to :destination }
    
  end



end
