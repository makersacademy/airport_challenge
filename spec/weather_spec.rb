require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  #allow(subject).to receive(:stormy?) { true }
  #expect(subject.stormy?).to eq(true)
end