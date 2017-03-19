require './lib/plane.rb'

describe Plane do

  describe '#flying' do

    it 'responds to "flying"' do
      expect(subject).to respond_to :flying
    end
  end
end
