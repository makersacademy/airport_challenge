require 'airport'
require 'plane'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to(:plane_lands)
  end

  it 'plane takes off' do
    expect(subject).to respond_to(:plane_takes_off)
  end

  it 'plane is landing' do
    plane = Plane.new
    expect(subject.plane_lands(plane)).to eq([plane])
  end

  describe '#plane_lands' do
    it 'throws an error when there is no space for a new plane to land' do
    10.times { subject.plane_lands Plane.new }
    expect { subject.plane_lands Plane.new }.to raise_error 'Airport is full'
  end
end

  describe '#plane_takes_off' do
    it 'throws an error when there are no planes at the airport' do
      expect { subject.plane_takes_off }.to raise_error 'There are no planes at the airport'
    end
  end


end
