require 'airport' 

describe Airport do
  let(:plane) {Plane.new}
  subject(:airport) { described_class.new }

  describe '#config' do
    it 'can store planes on its tarmac' do
      expect(subject.tarmac).to be_a_kind_of(Array)
    end

    it 'can change capacity' do
      airport = Airport.new('NYC', 10)
      expect(airport.capacity).to eq 10
    end

  end

  describe '#landing' do
    it 'is permitted when sunny' do
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.tarmac).to include(plane.name)
    end

    it 'is denied if stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error('Treacherous conditions. Stay put.')
    end

    it 'is denied if capacity is full' do
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:stormy?).and_return(false)
      expect { subject.land(plane) }.to raise_error('Tarmac is full.')
    end

  end

  describe "#take_off" do
      it 'is permitted if sunny' do
        allow(airport).to receive(:stormy?).and_return(false)
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.tarmac).to_not include(plane.name)
        expect(plane.ground).to eq false
        expect(plane.location).to eq 'Sky'
      end

      it 'can confirm that the plane has taken off' do
        allow(airport).to receive(:stormy?).and_return(false)
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.confirm(plane)).to eq 'Flying high!'
      end

      it 'prevents take off if stormy' do
        allow(airport).to receive(:stormy?).and_return(true)
        plane = Plane.new('EZY999')
        plane.ground = false
        plane.location = subject.name
        subject.tarmac << plane
        expect { subject.take_off(plane) }.to raise_error('Stormy. Cannot take off.')
      end

      it 'cannot take off a plane in another airport' do
        allow(airport).to receive(:stormy?).and_return(false)
        heathrow = Airport.new("heathrow", 1)
        heathrow
        ezy = Plane.new
        ba = Plane.new
        airport.land(ba)
        heathrow.land(ezy)
        expect { airport.take_off(ezy) }.to raise_error("Aircraft is not under your control.")
      end

    end

  end

