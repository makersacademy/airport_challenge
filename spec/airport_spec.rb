require 'Airport'

describe Airport do
  it {is_expected.to respond_to :instruct_to_land}

  it 'should return a landed plane' do
    plane = double(:plane)
    expect(subject.instruct_to_land(plane)).to eq plane
  end
end
