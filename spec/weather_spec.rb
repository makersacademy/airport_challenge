require 'weather'
describe 'weather' do
  storm = Weather.new
  it 'tests response to stormy? method' do
    expect(storm).to respond_to :stormy?
  end
end
