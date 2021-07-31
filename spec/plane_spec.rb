require './lib/plane'

describe Plane do

  it { is_expected.to be_instance_of(Plane) }

  it { is_expected.to respond_to(:take_off) }

  context 'plane has taken off' do
    
    it 'is not at the airport' do
      airport = double('heathrow')
      allow(airport).to receive_messages(planes: [subject])

      subject.take_off(airport)
      expect(subject).to be_airborne
      expect(airport.planes).to be_empty
    end

  end

end
