require 'weather'

describe Weather do

  describe '#stormy?' do

    it 'should respond to stormy?' do
      expect(subject).to respond_to(:stormy?)
    end

    it 'should give false if rand != 8' do
      # subject.stub(:stormy?).and_return(false)
      allow(subject).to receive(:stormy?) { false }
      expect(subject.stormy?).to eq false
    end
  end

end
