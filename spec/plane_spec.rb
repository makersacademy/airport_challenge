require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'flying? method eq true when start_flying called' do
    plane.start_flying
    expect(plane.flying?).to eq true
  end

  it 'flying? method eq false when end_flying called' do
    plane.end_flying
    expect(plane.flying?).to eq false
  end

end
