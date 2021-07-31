require './lib/airport'

describe Airport do
let(:plane) { Plane.new }

  it { is_expected.to be_instance_of(Airport) }
  
  describe '#land' do
    
    # it 'planes can land at an airport' do
    #   expect(subject).to respond_to(:land).with(1).argument
    # end

    it 'planes can land at an airport' do
      subject.land(plane)
      expect(subject.plane).to eq plane
    end

  end

  describe '#take_off' do
    
    it 'planes can take_off from an airport' do
      expect(subject).to respond_to(:take_off)
    end

    # it 'once a plane takes off it is not at the airport' do
    #   subject.land(plane)

    # end

  end

end
