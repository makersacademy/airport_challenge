require 'plane'

describe Plane do
  subject(:plane) { described_class.new(airport) }

  let(:person) { double(:person) }
  let(:people) { [person,person,person] }
  let(:airport) { double(:airport) }
  let(:another_airport) { double(:another_airport)}

  let(:loads) { plane.load(people) }
  let(:unloads) { plane.unload }
  let(:waiting_room) { plane.seats }
  let(:takes_off) { plane.take_off(airport) }

  before :each do
    srand(0)
  end

  it 'can be instantiated' do
    expect(plane.class).to eq Plane
  end

  describe '#load' do
    before do
      allow(airport).to receive(:seats) { people }
    end
    it '#load returns plane' do
      expect(loads).to eq plane
    end
    it 'can load people' do
      expect(loads).to eq plane
    end
    it 'raises error if loading whilst airbourne' do
      takes_off
      message = "Plane airbourne! What are we loading? Seagulls!"
      expect{ loads }.to raise_error message
    end
  end

  describe '#unload' do
    it '#unload returns passengers exiting plane' do
      expect(unloads).to eq waiting_room
    end
    it 'unloads all passengers' do
      allow(airport).to receive(:seats) { people }
      loads
      unloads
      expect(waiting_room.empty?).to eq true
    end
    it 'raises error when unloading if airbourne' do
      plane.take_off(airport)
      message = "Plane airbourne! You must be nuts!"
      expect{ plane.unload }.to raise_error message
    end
  end

  describe '#take_off' do
    it "confirm it's taken off" do
      message = "Plane has taken off and no longer at airport!"
      expect(takes_off).to eq message
    end
    it "raises error when already airbourne" do
      plane.take_off(airport)
      expect{ takes_off }.to raise_error "Plane already airbourne!"
    end
    it "doesn't take off when stormy" do
      srand(70)
      message = "Weather stormy. Can't take off!"
      expect{ takes_off }.to raise_error message
    end
    it "can't take off from wrong airport" do
      message = "Plane can't take off from wrong location!"
      expect{plane.take_off(another_airport)}.to raise_error message
    end
  end

  describe '#land' do
    let(:lands) { plane.land(airport) }
    before do
      allow(airport).to receive(:full?) { true }
    end
    it "raises error when already grounded" do
      message = "Plane can't land! Already grounded!"
      expect{ lands }.to raise_error message
    end
    it "raises on error if airport is full" do
      takes_off
      message = "Plane can't land! Airport is full"
      expect{ lands }.to raise_error message
    end
    it "confirms it's landed" do
      allow(airport).to receive(:full?) { false }
      takes_off
      expect( lands ).to eq "Plane has landed at airport!"
    end
    it "doesn't land when stormy" do
      allow(airport).to receive(:full?) { false }
      takes_off
      srand(70)
      expect{ lands }.to raise_error "Weather stormy. Can't land!"
    end
  end

end