require 'plane'

describe Plane do
  let(:plane) {Plane.new}
  it 'has a default state of "flying"' do 
    expect(plane.flying).to eq(true)
  end 
end 