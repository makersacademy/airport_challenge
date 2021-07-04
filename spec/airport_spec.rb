require 'airport'

describe Airport do
  it { is_expected.to respond_to :hangar }

  describe '#initialize' do
    it 'has a hangar when an airport is created' do
      expect(subject.hangar).to eq([])
    end
  end

  
end
