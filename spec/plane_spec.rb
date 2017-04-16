require './lib/plane.rb'

describe Plane do

  it '#able to land a flying plane' do
    subject.land_plane
    expect(subject.flying).to be false
  end

end
