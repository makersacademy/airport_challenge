require './lib/plane.rb'

describe Plane do
  let(:plane) {Plane.new}

  it 'has a flying status when created' do
    expect(plane.flying).to eq true
  end

  # it {is_expected.to respond_to(:lands)}
  # it {is_expected.to respond_to(:takes_off)}

  it 'has a landed status when on the ground' do
    plane.lands
    expect(plane.flying).to eq false
  end

  it 'has a flying status when in the air' do
    plane.takes_off
    expect(plane.flying).to eq true
  end

end
