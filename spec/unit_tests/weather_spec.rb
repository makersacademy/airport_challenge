require 'weather'

describe Weather do

    describe '#condition_selector' do
      it 'should return one of the weather conditions' do
        expect(["stormy", :sunny]).to include(subject.selector)
      end
    end

    describe '#stormy?' do
      it 'should return true when weather condition is stormy' do
        allow(subject).to receive(:selector).and_return("stormy")
        expect(subject.stormy?).to eq(true)
      end
    end

    describe '#stormy?' do
      it 'should return false if weather condition is not stormy' do
        allow(subject).to receive(:selector).and_return(:sunny)
        expect(subject.stormy?).to eq(false)
      end
    end

end
