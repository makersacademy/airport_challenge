require 'plane'

describe Plane do
  it 'can create instance of Plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  it { is_expected.to respond_to :flying }
end
