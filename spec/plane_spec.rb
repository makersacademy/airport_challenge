require 'plane'

describe Plane do
    it { is_expected.to respond_to :landed? }

plane = Plane.new

  it 'lands at an airport and confirms it has' do
    expect(plane.landed?).to eq true
  end
end
