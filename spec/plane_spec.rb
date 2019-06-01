require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land) }

  it 'should confirm that it is no longer at airport once take off' do
    subject.take_off
    expect(subject).not_to be_at_airport 
  end

  it 'should be initialised with a state of being at the airport' do
    expect(subject.instance_variable_get(:@at_airport)).to be true
  end

end