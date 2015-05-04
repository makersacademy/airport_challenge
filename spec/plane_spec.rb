require 'plane'

describe Plane do

  # When we create a new plane, it should have a "flying" status,
  # thus planes can not be created in the airport.
  it 'has a flying status when created' do
    expect(subject).to be_flying
  end

  # This test is tautologous, and at best repeats other tests. Ignoring
  # xit 'has a flying status when in the air'

  it 'can take off' do
    airport = double(:airport)
    # Doubling airport.land bypasses capacity and weather checks
    allow(airport).to receive(:land).and_return(airport)
    # Likewise with airport.launch
    allow(airport).to receive(:launch).and_return(subject)
    subject.land airport
    expect { subject.launch }.not_to raise_error
  end

  # When the plane takes of from the airport, the plane's status
  # should become "flying"
  it 'changes its status to flying after taking off' do
    airport = double(:airport)
    allow(airport).to receive(:land).and_return(airport)
    allow(airport).to receive(:launch).and_return(true)
    subject.land airport
    subject.launch
    expect(subject).to be_flying
  end

  # When we land a plane at the airport, the plane in question should
  # have its status changed to "landed"
  # Note: due to chosen structure, this isn't precisely what's stored
  it 'cannot land at an airport when it is already landed' do
    airport = double(:airport)
    allow(airport).to receive(:land).and_return(true)
    subject.land airport
    expect {subject.land airport}.to raise_error('Already landed!')
  end

  it 'cannot launch if it is already flying' do
    expect {subject.launch}.to raise_error('Already flying!')
  end

end
