require 'airport'

describe Airport do
  let(:plane) { double(:plane) }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :is_parked? }


  context '#land' do
    it 'check that land saves the plane' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  context '#take_off' do
    it 'allows the plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'allows a ready plane to take off' do
      plane1 = double(:plane)
      plane2 = double(:plane)
      plane3 = double(:plane)
      subject.land(plane1)
      subject.land(plane2)
      subject.land(plane3)
      subject.take_off(plane2)
      expect(subject.planes).not_to include(plane2)
    end

  end
  context '#is_parked?' do
    it 'is parked' do
      subject.land(plane)
      expect(subject.is_parked?(plane)).to eq true
    end
    it 'is not parked' do
      expect(subject.is_parked?(plane)).to eq false
    end
  end




end
