require 'airport'

describe Airport do
  let(:plane1) { double(:plane1, :landed? => true, :set_landed => true)}
  before(:each) do
    @airport = Airport.new
  end

  context 'responses' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to :current_planes }
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
  end

end
