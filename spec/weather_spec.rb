require 'weather'
describe Weather do
  subject(:weather) {Weather.new}
  it 'responds to stormy' do
    expect(weather).to respond_to :stormy?
  end
  it 'returns true for stormy weather' do
    expect(weather).to be_stormy
  end

end
