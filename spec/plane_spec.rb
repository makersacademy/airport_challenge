require 'plane'

describe Plane do
  let(:airport) { Airport.new }

  it 'can change state to landed' do
    subject.land
    expect(subject.status).to eq 'landed'
  end

  it 'can change state to flying' do
    subject.fly
    expect(subject.status).to eq 'flying'
  end

end
