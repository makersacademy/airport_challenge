require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  let(:person) { double(:person) }
  let(:airport) { double(:airport) }

  let(:people) { [person,person,person] }
  let(:mob) { [*1..100] }
  let(:mob2) { [*1..101] }


  let(:loads) { plane.load(people) }
  let(:unloads) { plane.unload }
  let(:default_loads) { plane.load }
  let(:waiting_room) { plane.seats }

  before :each do
    srand(0)
  end

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
    it "confirm it's taken off" do
      expect(plane.take_off).to eq "Plane has taken off and no longer at airport!"
    end
    it "raises error when already airbourne" do
      plane.take_off
      expect{ plane.take_off }.to raise_error "Plane already airbourne!"
    end
    it "doesn't take off when stormy" do
      srand(70)
      expect{ plane.take_off }.to raise_error "Weather stormy. Can't take off!"
    end
  end

  describe '#land' do
    it "raises error when already grounded" do
      allow(airport).to receive(:full?) { true }
      expect{ plane.land(airport) }.to raise_error "Plane can't land! Already grounded!"
    end
    it "confirms it's landed" do
      allow(airport).to receive(:full?) { false }
      plane.take_off
      expect( plane.land(airport) ).to eq "Plane has landed at airport!"
    end
    it "raises on error if airport is full" do
      allow(airport).to receive(:full?) { true }
      plane.take_off
      expect{ plane.land(airport) }.to raise_error "Plane can't land! Airport is full"
    end
    it "doesn't land when stormy" do
      allow(airport).to receive(:full?) { false }
      plane.take_off
      srand(70)
      expect{ plane.land(airport) }.to raise_error "Weather stormy. Can't land!"
    end
  end

end