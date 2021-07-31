require './lib/plane'

describe Plane do

  it { is_expected.to be_instance_of(Plane) }

  it { is_expected.to respond_to(:take_off) }

  context 'plane has taken off' do
    
    it 'is not at the airport' do
      subject.take_off
      expect(subject).to be_airborne
    end

  end

end
