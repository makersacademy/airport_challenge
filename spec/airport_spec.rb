require 'airport'

describe Airport do
  let(:plane) { double(:plane) }

  it { is_expected.to respond_to :land }
  context 'landing' do

    it 'check that land saves the plane' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end


  end
end
