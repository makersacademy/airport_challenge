require 'airport'

describe Airport do
  let(:plane){double('plane')}
  let(:airport){Airport.new([plane,plane,plane])}

  it 'stores airplanes' do
    expect(airport.planes).to contain_exactly(plane,plane,plane)
  end
end
