require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before do
    allow(plane).to receive(:land!)
    allow(plane).to receive(:take_off!)
    allow(subject).to receive(:stormy_weather?) { false }
  end
  context 'taking off and landing' do
    it 'a plane can land in normal conditions' do
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it 'a plane can take off in normal conditions' do
      subject.land_plane(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

  context 'traffic control' do

    it 'can return the landed planes' do
      subject.land_plane(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'a plane cannot land if the airport is full' do
      20.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'Airport Full'
    end

    it 'a plane cannot take off if the airport is empty' do
      expect { subject.take_off(plane) }.to raise_error 'Airport Empty'
    end

    it 'a plane not at the airport cannot take off' do
      subject.land_plane(plane)
      plane1 = double('plane', land!: true)
      expect do
        subject.take_off(plane1)
      end.to raise_error 'That plane is not in the airport'
    end

    context 'weather conditions' do
      let(:airport) { Airport.new }
      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:stormy_weather?).and_return(false, true)
        subject.land_plane(plane)
        expect { subject.take_off(plane) }.to raise_error 'Stormy Weather'
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:stormy_weather?) { true }
        expect { subject.land_plane(plane) }.to raise_error 'Stormy Weather'
      end
    end
  end
end
