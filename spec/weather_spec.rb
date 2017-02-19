require 'weather'
require 'airport'
require 'plane'

  describe Weather do

    before do
      allow(@airport).to receive(:stormy).and_return(true)
    end

    let(:plane) { Plane.new }
    let(:airport) { Airport.new }

  subject(:weather) { described_class.new }

  it {is_expected.to respond_to(:stormy) }

  it 'Checks if an array has been created for @condition' do
    expect(subject.conditions).to be_kind_of(Array)
  end

  it 'raises exception if capacity limit has been reached' do
    airport.capacity.times { airport.land(plane)}
    expect{(airport.land(plane))}.to raise_error 'No more room for planes'
end

end
