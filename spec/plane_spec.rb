require 'plane'


describe Plane do

  describe '#report_landed' do
    it 'reports a plane as landed' do
      subject.report_landed
      expect(subject).to be_landed
    end
  end

  describe '#report_take_off' do
    it 'reports a plane as leaving airport' do
      subject.report_take_off
      expect(subject.landed?).not_to be_truthy
    end
  end



end
