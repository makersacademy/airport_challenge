require 'plane'

describe Plane do

  subject { described_class.new }

  it 'initializes new planes in the air' do
    expect(subject).to be_in_air
  end 

  describe '#in_air?' do
    it 'confirms whether a plane is in the air' do
      expect(subject.in_air?).to eq(true)
    end
  end

  describe '#ground' do
    it 'changes plane location as not in air' do
      subject.ground
      expect(subject).not_to be_in_air
    end
  end

  describe '#airborn' do
    it 'changes plane location as in the air' do
      subject.ground
      subject.airborn
      expect(subject).to be_in_air
    end
  end

end
