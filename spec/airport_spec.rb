require 'airport'

describe Airport do
  let(:plane) { double(:plane, :set_location => nil) }

  it 'can create instances of Airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  it 'dispatches a plane' do
    subject.receive(plane)
    subject.dispatch(plane)
    expect(subject.planes).to be_empty
  end

  it 'fails when dispatching a plane that is not present' do
    expect { subject.dispatch(plane) }.to raise_error 'Plane not present in airport'
  end

  it 'receives a plane' do
    subject.receive(plane)
    expect(subject.planes).to contain_exactly(plane)
  end

  it 'fails when receiving a plane that is already present' do
    subject.receive(plane)
    expect { subject.receive(plane) }.to raise_error 'Plane already present in airport'
  end
end
