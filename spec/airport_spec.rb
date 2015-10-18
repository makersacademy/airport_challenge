require 'airport'

describe Airport do
  
  let(:subject) { Airport.new('airport') }

  describe 'inititialization' do
    it 'is created with a name' do
      expect(subject.name).to eq 'airport'
    end

    it {is_expected.to respond_to (:capacity) }

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#full' do
    it {is_expected.to respond_to (:full) }
  end

end