require 'airport'

describe Airport do

  let(:planes) {double("planes")}
  let(:plane) {double("plane")}

  it 'allows a plane to land' do
    expect(subject.instruct_to_land(plane)).to eq [plane]
  end

end
