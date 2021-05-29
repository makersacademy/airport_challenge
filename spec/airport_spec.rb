require 'airport'

describe Airport do
  it 'can instruct a plane to land at an airport' do
    subject.land
    expect(subject.airport).to include('plane')
  end
end
