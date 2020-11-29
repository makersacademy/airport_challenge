require 'airport'
require 'plane'

describe Plane do 

  let(:airport) { double(:airport) } 

# I would like to instruct a plane to take off and confirm it is no longer in the airport

  it 'instructs plane to take off and confirm it is in the air' do
    subject.takeoff
    expect(subject.location).to eq :air
  end
end
