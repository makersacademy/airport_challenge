require 'plane'
require 'airport'

describe Plane do

# airport = (double (:airport)
# airport2 = (double (:airport2))

  describe '#report_landed(nil)' do

    it 'reports a plane as landed' do
      subject.report_landed(nil)
      expect(subject).to be_landed
    end

    it 'stops landed plane being landed again' do
      subject.report_landed(nil)
      expect { subject.report_landed(nil) }.to raise_error "landed plane already"
    end

  end

  describe '#report_take_off' do

    it 'reports a plane as leaving airport' do
      subject.report_take_off
      expect(subject.landed?).not_to be_truthy
    end

    it 'stops an inflight plane taking off' do
      subject.report_take_off
      expect { subject.report_take_off }.to raise_error "Same plane cannot take off"
    end
    #
    # it 'a plan cannot take off from an airport it is not in' do
    #   subject.report_landed(airport)
    #   expect { subject.report_take_off(airport2)}.to raise_error "Not in this airport"
    # end
  end



end
