require 'airport'
require 'aeroplane'

describe Airport do

  let(:subject)   {Airport.new}
  # let(:aeroplane) {Aeroplane.new}
  
  it 'allows a plane to land in the airport' do
    plane = Aeroplane.new
    expect(subject.land(plane)).to eq plane
  end
end
