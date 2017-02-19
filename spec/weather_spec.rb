require 'weather'
require 'airport'
require 'plane'

  describe Weather do

    before do
      allow(@airport).to receive(:storm?).and_return(true)
    end

    let(:plane) { Plane.new }
    let(:airport) { Airport.new }

  subject(:weather) { described_class.new }

  it {is_expected.to respond_to(:storm?) }

  it 'Checks if an array has been created for @condition' do
    expect(weather.conditions).to be_kind_of(Array)
  end

end
