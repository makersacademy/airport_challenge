require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'flying? method eq true when start_flying called' do
    expect(plane).to respond_to(:flying?)
    expect(plane).to respond_to(:start_flying)
    plane.start_flying
    expect(plane.flying?).to eq true
  end

  it 'flying? method eq false when end_flying called' do
    expect(plane).to respond_to(:flying?)
    expect(plane).to respond_to(:end_flying)
    plane.end_flying
    expect(plane.flying?).to eq false
  end

end
