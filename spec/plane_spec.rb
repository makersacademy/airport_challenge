require 'plane'

describe Plane do

  it 'responds to in_air?' do
    expect(subject).to respond_to :in_air?
  end

  it 'responds to on_ground?' do
    expect(subject).to respond_to :on_ground?
  end

  it 'expect a plane to be in air' do
    expect(subject.in_air?).to eq true
  end

  it 'responds to lift off' do
    expect(subject).to respond_to :lift_off
  end

  describe '#on_ground?' do
    it 'changes plane status' do
      expect(subject.on_ground?).to eq false
    end
  end

  describe '#lift_off' do
    it 'changes plane status' do
      expect(subject.lift_off).to eq true
    end
  end
end