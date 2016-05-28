require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  let(:person) { double(:person) }
  let(:people) { [person,person,person] }
  let(:mob) { [*1..100] }
  let(:mob2) { [*1..101] }

  let(:loads) { plane.load(people) }
  let(:unloads) { plane.unload }
  let(:default_loads) { plane.load }
  let(:waiting_room) { plane.seats }

  it 'can be instantiated' do
    expect(plane.class).to eq Plane
  end


  describe '#load' do
    it {is_expected.to respond_to(:load).with(1).argument }

    it '#load returns plane' do
      expect(loads).to eq plane
    end
    it 'can load one or more people' do
      expect(loads).to eq plane
    end
    it 'can load with default argument' do
      expect(default_loads).to eq plane
    end
    it 'default loads one person' do
      default_loads
      expect(waiting_room.size).to eq 1
    end
    it 'loaded passengers in plane and not mutiple sitting in one seat' do
      default_loads
      loads
      expect(waiting_room.size).to eq 4
    end

  end

  describe '#unload' do
    it '#unload returns passengers exiting plane' do
      expect(unloads).to eq waiting_room
    end
    it 'unloads all passengers' do
      loads
      unloads
      expect(waiting_room.empty?).to eq true
    end
    it 'raises error when unloading if airbourne' do
      plane.take_off
      expect{ plane.unload }.to raise_error "Plane airbourne! You must be nuts!"
    end
  end

  describe '#take_off' do
    it 'can take off' do
      expect(plane.take_off).to eq true
    end
    it "raises error when already airbourne" do
      plane.take_off
      expect{ plane.take_off }.to raise_error "Plane already airbourne!"
    end
  end

  describe '#land' do
    it "raises error when already grounded" do
      expect{ plane.land }.to raise_error "Plane can't land! Already grounded!"
    end
    it "confirms it's landed" do
      plane.take_off
      expect(plane.land).to eq true
    end
  end

end