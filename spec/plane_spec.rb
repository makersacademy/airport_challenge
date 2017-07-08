require 'plane'

describe Plane do

  describe '#initialize' do

    it 'initializes' do
      expect(subject).not_to be_nil
    end

    it 'generates a name' do
      expect(subject.name).not_to be_nil
    end
  end

end
