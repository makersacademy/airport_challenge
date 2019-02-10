require 'weather'

describe Weather do
  describe 'test outputs of weather class' do
    it 'outputs boolean when asked if stormy' do
      expect(subject).to receive(:stormy_currently?).and_return boolean
      subject.stormy_currently?
    end
  end
end
