require 'airport'

describe Airport do

  it 'responds to landing instructions' do
    expect(subject).to respond_to :instruct_to_land
  end

  it 'can instruct to land a plane' do
    plane = subject.instruct_to_land
    expect(plane).to be_landed
  end

  it 'responds to take-off instructions' do
    expect(subject).to respond_to :instruct_to_take_off
  end

end
