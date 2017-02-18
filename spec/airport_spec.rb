require 'airport'

describe Airport do

let(:plane) { Plane.new }

  describe '#land' do
    it 'lands a plane when instructed' do
      expect(subject.land(plane)).to eq plane
    end

    it 'doesn\'t land a plane when airport is full' do
      full_error = 'Cannot land, airport full'
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error full_error
    end
  end

  describe '#take_off' do
    it 'takes off a plane when instructed' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end




end
