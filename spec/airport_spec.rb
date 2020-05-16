require 'airport'

describe Airport do
  it 'Should have an airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  describe '#land' do
    it 'Should respond to #land' do
      expect(subject).to respond_to(:land)
    end
    
    let(:plane) {Plane.new}
    it 'Should #land a plane in the airport' do
      expect(subject.land(plane)).to eq(plane)
    end
  end
end
