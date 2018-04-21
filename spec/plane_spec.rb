require 'plane'

describe Plane do

subject(:plane) { described_class.new }

  context "#land" do
    it 'returns status for landed planes' do
      expect(subject).to be_truthy
    end
  end



end
