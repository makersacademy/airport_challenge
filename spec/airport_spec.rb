require_relative '../lib/airport'
require_relative '../lib/plane'

describe Airport do

  it 'stores a landed plane' do
    plane = Plane.new
    subject.landing(plane)
    expect(subject.planes).to eq ([plane])
  end

end