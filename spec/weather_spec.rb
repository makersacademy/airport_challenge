require 'weather'

describe Weather do
  let(:airport) { double :airport }

  context 'weather status' do

    it 'can be stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect(airport).to be_stormy
    end

    it 'can be sunny' do
      allow(airport).to receive(:sunny?) { true }
      expect(airport).to be_sunny
    end

    it 'is only stormy when num = 3' do
      allow(subject).to receive(:stormy?) { 3 }
      allow(airport).to receive(:stormy?) { true }
      expect(airport).to be_stormy
    end
  end
end