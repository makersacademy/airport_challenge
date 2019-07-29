require 'airport_runway'

describe AirportRunway do

  describe 'weather report' do
    it "reports storm" do
      subject.report_storm
      expect(subject.weather?).to eq(false)
    end

  end

end
