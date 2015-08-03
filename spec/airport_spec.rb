require 'airport'
require 'weather'

describe Airport do

  let(:plane) {double :plane}

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument}
    it 'instructs a plane to take off' do
      allow(plane).to receive(:flying).and_return(true)
      plane.flying
      expect(plane).to have_received(:flying)
    end
    it 'releases a plane' do
      allow(plane).to receive(:flying).and_return(true)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end

  describe '#landing' do
    it { is_expected.to respond_to(:landing).with(1).argument}
    it 'instructs a plane to land' do
      allow(plane).to receive(:landed).and_return(true)
      plane.landed
      expect(plane).to have_received(:landed)
    end
    it 'airport receives a plane' do
      allow(plane).to receive(:landed).and_return(true)
      subject.landing(plane)
      expect(subject.planes).to_not be_empty
    end
  end

  describe 'traffic control' do
    context 'airport not full' do
      it 'accepts a plane' do
        allow(plane).to receive(:landed).and_return(true)
        expect{ subject.landing plane }.to change{ subject.planes.count }.from(0).to(1)
      end
    end
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(plane).to receive(:landed).and_return(true)
        subject.capacity.times { subject.landing plane }
        expect { subject.landing plane }.to raise_error 'Can not land plane'
      end
    end

    context 'when weather conditions are stormy' do
      before(:each) do
        allow(subject).to receive(:weather) {:stormy}
      end
      it 'does not allow a plane to take off' do
        expect { subject.landing plane}.to raise_error 'Can not land plane'
      end
      it 'does not allow a plane to land' do
        expect { subject.take_off}.to raise_error 'Can not take off'
      end
    end
  end
end
