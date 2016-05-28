require 'airport'

feature 'Air Traffic control' do
  let(:weather) { double(:weather, stormy?: false) }
  subject(:airport) { described_class.new(10,weather) }
  let(:plane) { double(:plane, land: nil, take_off:nil, landed?: false) }

  scenario 'Airport reaches capacity, then stops landings' do

  end

end
