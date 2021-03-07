require 'covid'

describe Covid do
  describe '#travel_ban' do
    it { is_expected.to respond_to :travel_ban }
    it 'should ban countries on the banned list' do
      country = 'America'
      expect(subject.travel_ban(country)).to eq true
    end
    it 'should not ban countries that are not on the list' do
      country = 'France'
      expect(subject.travel_ban(country)).to eq false
    end
  end

  describe '#quarantine' do
    it { is_expected.to respond_to :quarantine }
    it 'should warn countries on the quarantine list' do
      country = 'France'
      expect(subject.quarantine(country)).to eq true
    end
    it 'should allow counties in without issue if on the OK list' do
      expect(subject.quarantine('Ireland')).to eq false
    end
  end

  describe '#covid_check' do
    it { is_expected.to respond_to :covid_check }
    it 'should not allow banned contries to come in' do
      country = 'America'
      expect { subject.covid_check(country) }.to raise_error
    end
    it 'should inform passengers to quarantine' do
      country = 'France'
      message = "Passengers from #{country} are required to quarantine upon arrival."
      expect(subject.covid_check(country)).to eq(message)
    end
    it 'should welcome passengers that are on neither list' do
      country = 'Ireland'
      expect(subject.covid_check(country)).to eq('Enjoy your stay!')
    end
  end
end
