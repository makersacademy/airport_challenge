require 'plane'

describe Plane do

  it 'can be docked at the airport' do
    subject.dock
    expect(subject).to be_landed
  end

  it 'can take off from the airport' do
    subject.take_off
    expect(subject).to_not be_landed
  end

end
