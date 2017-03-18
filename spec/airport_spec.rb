require 'airport'

describe Airport do

  describe '#release' do

      it 'allows a plane to take off' do
        plane = Plane.new
        subject.accept(plane)
        expect(subject.release(plane)).to eq plane
      end

      it 'cannot take off planes when empty' do
        expect {subject.release(Plane.new)}.to raise_error 'Airport empty!'
      end

      it 'should set planes taking off to flying' do
        plane = Plane.new
        subject.accept(plane)
        subject.release(plane)
        expect(plane.flying).to eq true
      end

  end

  describe '#accept' do

    it 'allows planes to land' do
      plane = Plane.new
      subject.accept(plane)
      expect(subject.planes[0]).to eq plane
    end

    it 'raises an error if the airport is full' do
      10.times {subject.accept(Plane.new)}
      expect {subject.accept(Plane.new)}.to raise_error 'Airport full!'
    end

    it 'should set landing planes to landed' do
      plane = Plane.new
      subject.accept(plane)
      expect(plane.flying).to eq false
    end

  end


end
