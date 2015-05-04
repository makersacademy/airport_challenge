require 'weather'

describe Weather do
  let(:airport) { double :airport }

  context 'weather status' do

    it 'airport responds to stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect(airport).to respond_to :stormy?
    end

    it 'can be stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect(airport).to be_stormy
    end

    it 'can be sunny' do
      allow(airport).to receive(:sunny?) { true }
      expect(airport).to be_sunny
    end
  end
end