require './lib/plane'

describe Plane do

  it { is_expected.to be_instance_of(Plane) }

  describe '#land_at' do
    
    it 'planes can land' do
      expect(subject).to respond_to(:land_at)
    end

  end


end
