require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double(:plane) }

  it 'can create an instance of Airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  context 'in clear weather' do
    it 'receives a plane successfully' do
      allow(subject).to receive(:adverse_conditions?).and_return(false)
      subject.receive(plane)
      expect(subject.has?(plane)).to be true
    end

    it 'fails to receive a plane that is already present' do
      allow(subject).to receive(:adverse_conditions?).and_return(false)
      subject.receive(plane)
      expect { subject.receive(plane) }.to raise_error 'Cannot receive plane already present in airport'
    end

    it 'fails to receive a plane when it is full' do
      allow(subject).to receive(:adverse_conditions?).and_return(false)
      20.times { subject.receive(Plane.new) }
      expect { subject.receive(plane) }.to raise_error 'Insufficient capacity to receive plane'
      expect(subject.full?).to be true
    end

    it 'dispatches a plane successfully' do
      allow(subject).to receive(:adverse_conditions?).and_return(false)
      subject.receive(plane)
      subject.dispatch(plane)
      expect(subject.has?(plane)).to be false
    end

    it 'fails to dispatch a plane that is not present' do
      allow(subject).to receive(:adverse_conditions?).and_return(false)
      expect { subject.dispatch(plane) }.to raise_error 'Cannot dispatch plane not present in airport'
    end
  end

  context 'in stormy weather' do
    it 'fails to dispatch a plane' do
      allow(subject).to receive(:adverse_conditions?).and_return(true)
      allow(subject).to receive(:has?).with(plane).and_return(true)
      expect { subject.dispatch(plane) }.to raise_error 'Cannot dispatch in stormy weather'
    end

    it 'fails to receive a plane' do
      allow(subject).to receive(:adverse_conditions?).and_return(true)
      expect { subject.receive(plane) }.to raise_error 'Cannot receive in stormy weather'
    end
  end
end
