require 'airport'

describe Airport do
  describe '#instruct_landing' do
    it 'instructs a plane to land' do
      expect(subject).to receive(:instruct_landing)
      subject.instruct_landing
    end
  end
end
