require 'plane'

describe Plane do
  it { is_expected.to respond_to :status }
  it { expect(subject.status).to eq 'landing' }

  describe '#plane_landing' do
    it 'Adds plane to hangar' do
      
    end
  end
end
