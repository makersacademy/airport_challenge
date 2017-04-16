require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it { is_expected.to respond_to :land }

  let(:plane) { Plane.new }

  describe '#land' do

    context 'when sunny' do
      it 'lands a plane and includes to ground fleet' do
        allow(subject).to receive(:storms?){false}
        subject.land(plane)
        expect(subject.ground_fleet).to include plane
      end
   end

   context 'when stormy'
      it 'gives an error when trying to land' do
        allow(subject).to receive(:storms?){true}
        message = "No landing due to weather conditions."
        expect{subject.land(plane)}.to raise_error message
      end
    end

    context 'when already on ground' do
      it 'gives an errror due to status' do
        allow(subject).to receive(:storms?){false}
        allow(plane).to receive(:landed?){true}
        message = "The plane has already landed"
        expect{subject.land(plane)}.to raise_error message
      end
    end

  it { is_expected.to respond_to :take_off }

  describe '#take_off' do

    context 'when sunny' do
      it 'flies a plane and removes it from the ground fleet' do
        allow(subject).to receive(:storms?){false}
        allow(plane).to receive(:on_air?){false}
        subject.take_off(plane)
        expect(subject.ground_fleet).not_to include plane
      end
    end

    context 'when storms' do
      it 'gives an error due to storms' do
        allow(subject).to receive(:storms?){true}
        message = "No taking off due to weather"
        expect{ subject.take_off(plane) }.to raise_error message
      end
    end

    context 'when already on air' do
      it 'gives an error due to status' do
        allow(subject).to receive(:storms?){false}
        allow(plane).to receive(:on_air?){true}
        message = "The plane has already taken off"
        expect{ subject.take_off(plane)}.to raise_error message
      end
   end
  end

  it {is_expected.to respond_to :in_airport?}

  describe '#in_airport?' do

    it 'checks if landed plane is in airport' do
      allow(subject).to receive(:storms?){false}
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end

    it 'checks if flying plane is in airport' do
      expect(subject.in_airport?(plane)).to eq false
    end

    it 'checks plane that took of is in airport' do
      allow(plane).to receive(:on_air?){false}
      allow(subject).to receive(:storms?){false}
      subject.take_off(plane)
      expect(subject.in_airport?(plane)).to eq false
    end

  end

 it {is_expected.to respond_to :full?}

  describe '#full?' do

    it 'returns full' do

      allow(subject).to receive(:storms?){false}
      allow(plane).to receive(:landed?){false}
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect(subject.full?).to be true
      end


    end

  end
