require 'airport'

describe Airport do
  describe '#land' do
    it 'Can do so' do
      plane = Plane.new
      expect(subject.land(plane)).to eq([plane])
    end

    it 'Will not do so if the airport is full' do
      Airport::CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full!'
    end
  end
  
  it 'Can instruct a stored plane to take off from the airport' do
    plane = Plane.new
    subject.land(plane)
    subject.depart(plane)
    expect(subject.stored_planes).to eq []
  end
end
