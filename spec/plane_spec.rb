require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:take_off) }

  it 'should confirm that it is no longer at airport once take off' do
    subject.take_off
    expect(subject).not_to be_at_airport 
  end


end