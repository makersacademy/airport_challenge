require 'airport'

describe Airport do
  let(:plane) { double(:plane, :set_location => nil) }

  it 'can create an instance of Airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  context 'in clear weather' do
    it 'dispatches a plane successfully' do
      allow(subject).to receive(:adverse_conditions?) {false}
      subject.planes.push(plane)
      subject.dispatch(plane)
      expect(subject.planes).to be_empty
    end

    it 'fails to dispatch a plane that is not present' do
      allow(subject).to receive(:adverse_conditions?) {false}
      expect { subject.dispatch(plane) }.to raise_error 'Plane not present in airport'
    end

    it 'receives a plane successfully' do
      allow(subject).to receive(:adverse_conditions?) {false}
      subject.receive(plane)
      expect(subject.planes).to contain_exactly(plane)
    end

    it 'fails to receive a plane that is already present' do
      allow(subject).to receive(:adverse_conditions?) {false}
      subject.receive(plane)
      expect { subject.receive(plane) }.to raise_error 'Plane already present in airport'
    end

    it 'fails to receive a plane when it is full' do
      allow(subject).to receive(:adverse_conditions?) {false}
      10.times { subject.receive(Plane.new) }
      expect { subject.receive(plane) }.to raise_error 'Airport does not have capacity'
    end
  end

  context 'in stormy weather' do
    it 'fails to dispatch a plane' do
      subject.planes.push(plane)
      allow(subject).to receive(:adverse_conditions?) {true}
      expect { subject.dispatch(plane) }.to raise_error 'Plane cannot take off in stormy weather'
    end

    it 'fails to receive a plane' do
      allow(subject).to receive(:adverse_conditions?) {true}
      expect { subject.receive(plane) }.to raise_error 'Plane cannot land in stormy weather'
    end
  end
end
