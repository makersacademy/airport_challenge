require './plane.rb'

describe Plane do
  it 'has a randomised id for the plane' do
    # plane = double(:plane, plane_id: 1234)
    allow(subject).to receive(:plane_id) { 1234 }
    expect(subject.plane_id).to eq(1234)
  end

end
