require 'plane'
require 'airport'

describe Plane do
  plane = Plane.new
  it {is_expected.to respond_to :landed?}
  it {is_expected.not_to be_landed}

  it 'has landed status when landed' do
    a = Airport.new
    a.land(subject)
    expect(subject).to be_landed
  end
end
