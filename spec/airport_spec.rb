require 'airport.rb'

describe Airport do
  it 'allows the user to create an Airport instance' do
    expect(subject).to be_instance_of Airport
  end

  describe '#land' do
    plane = Plane.new

    it 'lands a plane at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane' do
      expect(subject.land(plane)).to eq(plane)
    end
  end
end
