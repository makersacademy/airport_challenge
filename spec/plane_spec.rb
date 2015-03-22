require 'plane'
describe Plane do
  let(:plane) { Plane.new }
  it 'knows that it is flying' do
    expect(plane.flight).to eq 'flying'
  end
  it 'has a flying status when in flight' do
    plane.landing!
    plane.take_off!
    expect(plane.flight).to eq 'flying'
  end
  it 'can stay landed until ready for flight' do
    plane.landing!
    expect(plane.flight).to eq 'landed'
  end
  it 'can take off again once it lands' do
    plane.landing!
    plane.take_off!
    expect(plane.flight).to eq 'flying'
  end
  it 'cannot take off if it is already flying' do
    expect { plane.take_off! }.to raise_error('Plane is already flying!')
  end
end
