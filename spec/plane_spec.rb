require 'airport'
require 'plane'
describe Plane do 

let(:airport) { double(:airport) } 

  it 'instructs plane to take off and confirm it is in the air' do
    subject.takeoff
    expect(subject.location).to eq :air
  end
end
