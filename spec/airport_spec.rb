require 'Airport'

describe Airport do
  it {is_expected.to respond_to :instruct_to_land}

  it 'should land a plane' do
    plane = double(:plane)
    expect(subject.instruct_to_land(plane)).to eq [plane]
  end

  it 'should check that the plane is in the airport' do
    plane = double(:plane)
    subject.instruct_to_land(plane)
    expect(subject.landed_planes).to eq [plane]
  end
end
