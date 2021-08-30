require 'airport'

describe 'Airport' do
  
  it { is_expected.to respond_to :land }
  let(:plane) { Plane.new }
  
  describe '#land' do
    it 'instructs plane to be landed' do
      expect(plane).to respond_to(:land)
      subject.land(plane)
    end
    #it 'raises an error if plane, already in airport, tries to land' do
      #xpect { subject.land }.to raise_error 'Plane has already landed'
    #end
  end
end
