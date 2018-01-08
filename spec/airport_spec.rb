require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double(:plane) }

  it 'can create an instance of Airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  context 'when receiving planes' do
    it 'receives a plane successfully' do
      airport.receive(plane)
      expect(airport.has?(plane)).to be true
    end

    it 'fails to receive a plane that is already present' do
      airport.receive(plane)
      expect { airport.receive(plane) }.to raise_error 'Cannot receive plane already present in airport'
    end

    it 'fails to receive a plane when airport is full' do
      20.times { airport.receive(Plane.new) }
      expect { airport.receive(plane) }.to raise_error 'Insufficient capacity to receive plane'
    end
  end

  context 'when dispatching planes' do
    it 'dispatches a plane successfully' do
      airport.receive(plane)
      airport.dispatch(plane)
      expect(airport.has?(plane)).to be false
    end

    it 'fails to dispatch a plane that is not present' do
      expect { airport.dispatch(plane) }.to raise_error 'Cannot dispatch plane not present in airport'
    end
  end
end
