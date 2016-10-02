require 'plane'
require 'airport'

describe Plane do
  it 'has a status' do
    expect(subject.status).to eq 'in flight'
  end

  it 'instructs a plane to land' do
    expect(subject).to respond_to :land
  end

  it 'confirms when it has landed' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.status).to eq 'landed'
  end
end
