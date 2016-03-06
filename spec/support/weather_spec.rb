require 'weather'

shared_examples_for Weather do
  describe '#stormy?' do
    it {is_expected.to respond_to(:stormy?)}

    it 'is expected to yield a boolean value' do
      expect(subject.stormy?).not_to eq nil
    end
  end
end
