require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:person) { double(:person) }
  let(:people) { [person,person,person] }
  let(:mob) { [*1..100] }
  let(:mob2) { [*1..101] }

  let(:loads) { airport.load(people) }
  let(:unloads) { airport.unload }
  let(:default_loads) { airport.load }
  let(:waiting_room) { airport.passengers }

  it 'can be instantiated' do
    expect(airport.class).to eq Airport
  end

  it 'check if airport is empty before anyone arrives' do
    expect(airport.passengers).to be_an_instance_of Array
  end

  it 'check if arrived passengers in airport' do
    loads
    expect(waiting_room).to be_an_instance_of Array
  end

  it 'has a default capacity of 100' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'airport can be instantiated with new capacity' do
    expect(Airport.new(80).capacity).to eq 80
  end

  it 'airport can have capacity set' do
    airport.capacity = 20
    expect(airport.capacity).to eq 20
  end

  describe '#load' do
    it {is_expected.to respond_to(:load).with(1).argument }

    it '#load returns airport' do
      expect(loads).to eq airport
    end
    it 'can load one or more people' do
      expect(loads).to eq airport
    end
    it 'can load with default argument' do
      expect(default_loads).to eq airport
    end
    it 'default loads one person' do
      default_loads
      expect(waiting_room.size).to eq 1
    end
    it 'loaded passengers in airport and not mutiple sitting in one seat' do
      default_loads
      loads
      expect(waiting_room.size).to eq 4
    end

  end

  describe '#unload' do
    it '#unload returns passengers exiting airport' do
      expect(unloads).to eq waiting_room
    end
    it 'unloads all passengers' do
      loads
      unloads
      expect(waiting_room.empty?).to eq true
    end
  end

  describe '#full?' do
    it "confirms if it's not full" do
      expect( airport.full? ).to eq false
    end
    it "confirms if it's full" do
      airport.load(mob)
      expect( airport.full? ).to eq true
    end
    it "is limited by capacity" do
      expect { airport.load(mob2) }.to raise_error "Airport full!"
    end
  end


end