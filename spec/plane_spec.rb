require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'is a plane' do
    plane = subject
    expect(plane).to eq plane
  end

  # it 'has a flying status, which will be set to true by default' do
  #   expect(plane.flying).to eq true
  # end

  # it 'The status of a landed plane can change from "flying" to "landed"' do
  #   plane.flying = false
  #   expect(plane.flying).to eq false
  # end

end
