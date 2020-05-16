require 'airport'

describe Airport do
  subject { Airport.new }

  context 'landing' do

    plane = Plane.new

    before do
      plane.land(subject)
    end

    it 'airport responds to landing method and takes an argument' do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it 'adds the plane to the airport class' do
      expect(subject.instance_variable_get(:@planes)).to eq(plane)
    end

  end

  context 'take_off' do

  end

end
