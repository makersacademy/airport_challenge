require 'weather'
describe 'weather' do
  report = Weather.new
  it 'tests response to stormy? method' do
    expect(report).to respond_to :stormy?
  end

  # it 'tests if subject is stormy' do
  #   expect(subject).to be true
  # end
end
