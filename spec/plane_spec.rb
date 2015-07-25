require 'plane'

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#

describe Plane do

  let(:airport){ double :airport }
  let(:airport2){ double :airport2 }

	context 'when created' do 
		it 'is flying' do 
			expect(subject.flying?).to eq true
		end

    it 'has a destination' do 
      expect(subject.destination).to be_truthy
    end

    it "has a default destination of 'nowhere!'" do
      expect(subject.destination).to eq("nowhere!")
    end
	end

  context 'when created specifying an airport as a destination' do
    it 'has a destination that is that airport' do 
      plane = Plane.new(airport)
      plane.destination == airport
    end
  end

  it 'can land' do 
  	expect(subject).to respond_to :land
  end

  context 'after it lands' do

    it 'is landed' do
      plane = Plane.new(airport) 
      plane.land(airport)
      expect(plane).to be_landed
    end

    it 'no longer has a destination' do 
      plane = Plane.new(airport) 
      plane.land(airport)
      expect(plane.destination).to be_nil
    end

    it 'cannot be landed and flying at the same time' do 
      plane = Plane.new(airport) 
      plane.land(airport) 
      expect(plane).to_not be_flying
    end
  end

  it 'cannot be flying and landed at the same time' do 
  	expect(subject).to_not be_landed
  end

  it 'can take off' do 
    expect(subject).to respond_to :take_off
  end

  context 'after it has taken off' do 
    it 'is flying' do
      plane = Plane.new(airport) 
      plane.land(airport)
      plane.take_off(airport2)
      expect(plane).to be_flying
    end

    it 'has a new destination' do
      plane = Plane.new(airport) 
      plane.land(airport)
      subject.take_off(airport2)
      expect(subject.destination).to be(airport2)
    end
  end


  describe '#land' do 
    it 'raises an error if no argument is given' do
      expect{subject.land}.to raise_error(ArgumentError)
    end

    it 'does not raise an error if an argument is given' do
      plane = Plane.new(airport) 
      expect{plane.land(airport)}.to_not raise_error
    end

    it 'returns the plane when called on a plane' do
      plane = Plane.new(airport) 
      expect(plane.land(airport)).to eq plane
    end
  end

end
