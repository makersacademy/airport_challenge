require 'weather'

describe Weather do

  subject { described_class.new }

  describe '#create' do

    it 'generates stormy weather' do
      allow(Kernel).to receive(:rand).and_return(2)
      expect(subject.create).to eq(2)
    end

    it 'generates sunny weather' do
      allow(Kernel).to receive(:rand).and_return(0)
      expect(subject.create).to eq(0)
    end

    it 'generates cloudy weather' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(subject.create).to eq(1)
    end

    it 'generates rainy weather' do
      allow(Kernel).to receive(:rand).and_return(3)
      expect(subject.create).to eq(3)
    end
  end

end
