require 'airport.rb'

describe Airport do

  describe 'landing planes' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'has a limited capacity' do
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full!'
    end

  end

  describe 'taking planes off' do
    it 'lets a plane take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end
end
