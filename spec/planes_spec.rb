require 'planes'

RSpec.describe Planes do
  describe '#land' do
    it 'it should land' do
      expect(subject.land).to be_truthy
    end
  end
end
