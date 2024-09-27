require 'sky'
require 'plane'

RSpec::Matchers.define :all_be_airborne_planes do
  match do |actual|
    actual.all? { |planes| planes.airborne == true }
  end
end

RSpec.describe Sky do
  it 'cannot hold grounded planes' do
    expect(subject.planes_in_transit).to all_be_airborne_planes
  end
end
