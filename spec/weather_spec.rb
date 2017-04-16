require 'weather'
describe 'weather' do
  report = Weather.new
  it 'tests response to stormy? method' do
    expect(report).to respond_to :stormy?
  end

  it 'tests if report is stormy' do
    expect(report.stormy?).to be true
  end
end
