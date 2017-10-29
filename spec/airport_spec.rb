require 'airport'

describe Airport do

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off}

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do

    it 'landing a plane' do
      plane=Plane.new
      expect(subject.land(plane)).to eq subject.planes
    end

    it 'raises and error when airport is full' do
      20.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error(RuntimeError)
    end

  end

  describe '#take_off' do

    it 'raises an error when there are no planes available' do
      expect{ subject.take_off }.to raise_error(RuntimeError)
    end

  end


end
