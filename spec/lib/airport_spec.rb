require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:person) { double(:person) }
  let(:people) { [person,person,person] }
  let(:loads) { airport.load(people) }
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

    it 'can load one or more people' do
      expect(loads).to eq airport
    end
    it 'loads with default argument' do
      expect(default_loads).to eq airport
    end
    it 'loads with default one person' do
      default_loads
      expect(waiting_room.size).to eq 1
    end
    it 'passengers in airport include all people loaded' do
      loads
      default_loads
      expect(waiting_room.size).to eq 4
    end

  end

  describe '#unload' do
    it 'can unload' do
      unloads = airport.unload
      expect(unloads).to eq airport
    end
  end






end