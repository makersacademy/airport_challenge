require 'weather'
describe Weather do
  subject(:weather) {described_class.new}

  context 'behaviour' do
    it 'should update to a new weather state randomly' do
      acc = []
      1000.times do
        acc << weather.check_safe?
      end
      expect(acc.uniq.length).to be > 1
    end

    it 'should return unsafe to fly if weather is unsafe' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(weather.check_safe?).to be false
    end

    it 'should return safe to fly if weather is safe' do
      allow(Kernel).to receive(:rand).and_return(10)
      expect(weather.check_safe?).to be true
    end
  end
end
