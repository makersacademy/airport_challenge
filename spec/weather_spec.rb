require 'weather'
describe 'weather' do
  describe 'stormy' do
    report = Weather.new
    it 'tests response to stormy? method' do
      expect(report).to respond_to :stormy?
    end

    it 'tests if report is stormy' do
      allow(report).to receive(:stormy?) { 0 }
      expect(report.stormy?).to eq 0
    end
  end

end
