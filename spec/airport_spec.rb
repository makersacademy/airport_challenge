require 'airport'

describe Airport do
  let(:plane1) { double(:plane1, :landed? => true, :set_landed => true)}
  let(:plane2) { double(:plane2, 
                        :landed? => false, 
                        :set_landed => true, 
                        :take_off => true)}
  let(:plane_spy){ spy(:plane_spy) }
  
  before(:each) do
    @airport = Airport.new
  end

  context 'responses' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to :current_planes }
    it { is_expected.to respond_to :launch }
    it { is_expected.to respond_to :weather }
  end
  
  context '#land' do
    it 'doesnt cause an error when landing a plane' do
      expect{@airport.land(plane1)}.not_to raise_error
    end
    
    it 'lands a plane' do
      @airport.land(plane1)
      expect(@airport.current_planes.last).to eq plane1
    end
    
    it 'sets the plane to landed' do
      @airport.land(plane1)
      expect(plane1.landed?).to eq true
    end

    it 'calls the #set_landed method on the plane' do
      @airport.land(plane_spy)
      expect(plane_spy).to have_recieved(:set_landed)
    end
  end

  context '#launch' do
    it 'doesnt cause an error when launching a plane' do
      expect{@airport.land(plane2)}.not_to raise_error
    end

    it 'launches a plane' do
      @airport.land(plane2)
      temp_plane = @airport.launch
      expect(temp_plane).to eq plane2
    end

    it 'calls the #take_off method on the plane' do
      @airport.land(plane_spy)
      @airport.launch
      expect(plane_spy).to have_recieved(:take_off)
    end
  end

  context '#weather' do
    before(:each) do
      @airport = Airport.new("stormy")
    end

    it 'refuses to launch a plane when stormy' do
      expect{ @airport.launch }.to raise_error("It is too stormy to launch")
    end

    it 'refuses to land a plane when stormy' do
      expect{ @airport.land(plane1) }.to raise_error("It is too stormy to land")
    end
  end

end
