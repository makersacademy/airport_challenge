require 'plane'

describe Plane do

  it 'can be docked at the airport' do
    subject.dock
    expect(subject).to be_landed
  end

end
