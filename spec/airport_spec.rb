require 'airport'

describe Airport do
  it 'can create instances of Airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  it 'dispatches a plane' do
    plane = Plane.new
    plane.land(subject)
    subject.dispatch(plane)
    expect(subject.planes).to be_empty
  end

  it 'fails when dispatching a plane that is not present' do
    expect { subject.dispatch(Plane.new) }.to raise_error 'Plane not present in airport'
  end

  it 'receives a plane' do
    plane = Plane.new
    subject.receive(plane)
    expect(subject.planes).to contain_exactly(plane)
  end

  it 'fails when receiving a plane that is already present' do
    plane = Plane.new
    subject.receive(plane)
    expect { subject.receive(plane) }.to raise_error 'Plane already present in airport'
  end
end
