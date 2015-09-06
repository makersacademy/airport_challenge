require 'airport'

describe 'weather' do
  context 'when weather conditions are stormy' do
    before { srand(1)}

    it 'creates stormy conditions' do
      expect(subject).to respond_to(:stormy?).and_return(true)
    end

    it 'does not allow a plane to land' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.plane_land(plane) }.to raise_error
      'Cannot currently land at airport'
    end

    it 'does not allow a plane to take off' do
      subject.plane_land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.plane_take_off(plane)}.to raise_error
      'Cannot currently take off'
    end
  end
end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
