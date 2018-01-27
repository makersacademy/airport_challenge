require 'airport'
require 'plane'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do 
    it 'allows planes to land' do 
      plane = Plane.new
      expect(subject.land(plane)).to match_array([plane])
    end
    it 'raises an error when airport is full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'hangar full'
    end
  end

  describe '#take_off' do 
    it 'allows planes to take off' do 
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to match_array([])
    end
    it 'raises an error when airport is empty' do 
      expect { subject.take_off(Plane.new) }.to raise_error 'hangar empty'
    end
  end

  describe '#initialize' do 
    it 'allows to edit initialized capacity' do 
      airport = Airport.new
      expect(airport.capacity = 20).to eq 20
    end
  end
end
