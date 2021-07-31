require './lib/airport'
require './lib/plane'

describe Plane do

  it { is_expected.to be_instance_of(Plane) }

  it { is_expected.to respond_to(:take_off) }

  context 'plane has taken off' do
    
    it 'is not at the airport' do
      nice_weather = double('nice weather')
      allow(nice_weather).to receive_messages(safe: true)
      airport = double('heathrow')
      allow(airport).to receive_messages(planes: [subject])

      subject.take_off(airport, nice_weather)
      expect(subject).to be_airborne
      expect(airport.planes).to be_empty
    end

  end

  context 'weather is unsafe' do
    
    it 'the plane cannot take off' do
      stormy = double('Stormy')
      allow(stormy).to receive_messages(safe: false)
      expect { subject.take_off(Airport.new, stormy) }.to raise_error("Unsafe weather conditions")
    end

  end

end
