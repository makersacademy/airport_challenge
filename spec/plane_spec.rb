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
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

  let(:airport){ double :airport }

	context 'when created' do 
		it 'is flying' do 
			expect(subject.flying?).to eq true
		end
	end

  it 'can land' do 
  	expect(subject).to respond_to :land
  end

  context 'when it lands' do
    it 'returns itself' do 
      expect(subject.land(airport)).to eq subject
    end
  end

  it 'is landed after landing' do 
  	subject.land(airport)
  	expect(subject).to be_landed
  end

  it 'cannot be flying and landed at the same time' do 
  	expect(subject).to_not be_landed
  end

  it 'cannot be landed and flying at the same time' do 
  	subject.land(airport) 
  	expect(subject).to_not be_flying
  end

  describe '#land' do 
    it 'raises an error if no argument is given' do
      expect{subject.land}.to raise_error(ArgumentError)
    end

    it 'does not raise an error if an argument is given' do 
      expect{subject.land(airport)}.to_not raise_error
    end
  end

  xit 'can take off'

  xit 'is flying after take off'

end
