require 'airport'

describe Airport do

  describe '#initialize' do
    it 'Creating an Airport should set the default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'It should be possible to update an Airport capacity' do
      subject.capacity = 5
      expect(subject.capacity).to eq 5
    end
  end

end