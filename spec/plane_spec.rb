require_relative '../lib/plane'

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
# Think about your implementation
# does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  describe '#land' do
    it 'can land' do
      expect(subject).to respond_to(:land)
    end

    context 'if the plane has landed'do
      it 'should raise an error' do
        subject.land
        expect { subject.land }.to raise_error 'Plane has already landed'
      end
    end

    it 'is landed after landing' do
      subject.land
      expect(subject).to be_landed
    end
  end

  describe '#take_off' do
    it 'can take off' do
      expect(subject).to respond_to(:take_off)
    end

    context 'if the plane is already flying' do
      it 'should raise an error' do
        expect { subject.take_off }.to raise_error 'Plane is already flying'
      end
    end

    it 'is flying after take off' do
      subject.land
      subject.take_off
      expect(subject).to be_flying
    end
  end

end
