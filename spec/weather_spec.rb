describe Weather do
  describe '#current_windspeed_report' do
    it 'reports current windspeed (Beaufort scale) at the airport' do
      expect(Airport.new.current_windspeed_report).to be_between(1, 12)
    end
  end
end
