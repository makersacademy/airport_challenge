require 'airport'

describe Airport do
  it { is_expected.to respond_to(:plane_land) }
  it { is_expected.to respond_to(:capacity) }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "capacity can be changed" do
    expect(subject.capacity(5)).to eq 5
    expect(subject.capacity(7)).to eq 7
  end

  it '#raises an error when full' do 
    plane = Airport.new
    plane.capacity
    Airport::DEFAULT_CAPACITY.times do
      subject.plane_land(plane)
    end
    expect { subject.plane_land(plane) }.to raise_error('Cannot add another plane: Capacity full')
  end

  it '#plane lands and is added' do
    plane = Airport.new
    expect(subject.plane_land(plane)).to eq plane
  end

  it '#plane takes off and is removed' do
    plane = Airport.new
    subject.plane_land(plane)
    expect(subject.plane_take_off(plane)).to eq plane
  end
  it '#raises an error when there are no planes at airport' do 
    plane = Airport.new
    expect { subject.plane_take_off(plane) }.to raise_error('No planes at airport')
  end
end
