require 'airport'

# A plane currently in the airport can be requested to take off.

describe Airport do

  let(:plane) { double :plane, takeoff: true, land: true }

  context 'taking off and landing' do

    it 'a plane can land' do
      subject.receive plane
      planes = subject.planes
      expect(planes.include? plane).to be true
    end

    it 'a plane can take off' do
      allow(subject).to receive(:weather?).and_return('sunny')
      subject.receive plane
      subject.launch plane
      planes = subject.planes
      expect(planes.include? plane).to be false
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      subject.capacity.times { subject.receive plane }
      expect { subject.receive plane }.to raise_error 'airport cannot receive planes when at capacity'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:weather?).and_return('stormy')
        expect { subject.launch plane }.to raise_error 'plane cannot take off when storm brewing'
      end

      xit 'a plane cannot land in the middle of a storm'
    end

  end

  context 'airport capacity' do

    it 'airports commission instructs amend to airport capacity' do
      expect(subject.capacity = 50).to eq 50
    end

  end

end
