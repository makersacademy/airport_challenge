require 'airport'

feature 'Feature Testing' do
  subject(:airport) {Airport.new}
  before do
    allow(STDOUT).to receive(:puts)
    allow(Kernel).to receive(:rand).and_return(10)
  end

  describe 'Multiple Planes Landing' do
    before do
      @planes = []
      10.times{ @planes << Plane.new}
    end

    it 'can land multiple planes' do
      @planes[0..4].each {|plane| airport.land(plane)}
      expect(airport.instance_variable_get(:@landed_planes)).to eq(@planes[0..4])
    end

    it 'will fail if pushed to capacity' do
      expect{ @planes[0..7].each { |plane| airport.land(plane) } }.to raise_error 'Airport is full, the plane has diverted.'
    end

  end
  describe 'Multiple planes taking off' do
    it 'can takeoff multiple planes' do
      airport = Airport.new
      planes = []
      10.times{ planes << Plane.new}

      planes[0..5].each {|plane| airport.land(plane)}
      planes[0..3].each {|plane| airport.takeoff(plane)}

      expect(airport.instance_variable_get(:@landed_planes)).to eq(planes[4..5])
    end
  end
end
