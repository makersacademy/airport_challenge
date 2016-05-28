require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:person) { double(:person) }
  let(:people) { [person,person,person] }

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
    it '#unload returns airport' do
      expect(unloads).to eq airport
    end
    it 'unloads all passengers' do
      loads
      unloads
      expect(waiting_room.empty?).to eq true
    end
  end






end