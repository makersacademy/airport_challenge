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

  describe '#take_off' do
    it 'Should respond to #take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'Should confirm that a plane as taken off' do
      expect{ subject.take_off }.to output("Plane has taken off\n").to_stdout
    end
  end
end
