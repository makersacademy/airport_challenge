require 'airport'

describe Airport do
  it 'can respond to #land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can respond to #take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'has a maximum capacity' do
    expect(subject.capacity).to eq Airport::MAXCAPACITY
  end

  it 'can tell when it is full' do
    expect(subject).to respond_to(:full?)
  end

  context 'the weather is sunny' do
    it 'allows planes to take-off' do
      luton = double("Airport")
      allow(luton).to receive(:take_off).and_return(:hangar)
      expect(luton.take_off).to eq :hangar
    end

    it 'allows planes to land' do
      luton = double("Airport")
      allow(luton).to receive(:land).and_return(:hangar)
      expect(luton.land).to eq :hangar
    end
  end

  context 'the weather is stormy' do
    it 'will not allow planes to take-off' do
      luton = double("Airport")
      allow(luton).to receive(:take_off).and_raise("It's too stormy for take-off")
      expect{luton.take_off}.to raise_error "It's too stormy for take-off"
    end

    it 'will not allow planes to land' do
      luton = double("Airport")
      allow(luton).to receive(:land).and_raise("It's too stormy for landing")
      expect{luton.land}.to raise_error "It's too stormy for landing"
    end
  end


end
