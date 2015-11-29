require 'plane'

describe Plane do
  it 'responds to #land' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to #take_off' do
    expect(subject).to respond_to(:take_off)
  end

  context 'when the weather is fine' do
    it 'is able to land' do
      jet = double("Plane")
      allow(jet).to receive(:land).and_return(true)
      expect(jet.land).to be true
    end

    it 'is able to take-off' do
      jet = double("Plane")
      allow(jet).to receive(:take_off).and_return(false)
      expect(jet.take_off).to be false
    end
  end

  context 'when the weather is stormy' do
    it 'is not able to land' do
      jet = double("Plane")
      allow(jet).to receive(:land).and_raise("It's too stormy to land today")
      expect{jet.land}.to raise_error "It's too stormy to land today"
    end

    it 'is not able to take-off' do
      jet = double("Plane")
      allow(jet).to receive(:take_off).and_raise("It's too stormy to take off today")
      expect{jet.take_off}.to raise_error "It's too stormy to take off today"
    end
  end

end
