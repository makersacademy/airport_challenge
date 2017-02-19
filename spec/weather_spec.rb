require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  #checks that result of 1 evaluates stormy to true
  it 'evaluates stormy to true', :weather do
    allow(Kernel).to receive(:rand).and_return 1
    expect(weather.stormy?).to be true
  end
  #checks that result of 6 evaluates stormy to false
    it 'evaluates stormy to false', :weather do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather.stormy?).to be false
    end
#  end
end
