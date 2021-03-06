require 'safety_breach'

describe SafetyBreach do
  describe '#unattended_item' do
    it { is_expected.to respond_to :unattended_item }
    it 'should give a warning about the threat' do
      message = 'Warning, unattended item spotted, safety protocol started, safety level medium.'
      expect { subject.unattended_item }.to output(message).to_stdout
    end
  end

  describe '#drugs_on_person' do
    it { is_expected.to respond_to :drugs_on_person }
    it 'should give a warning about the threat' do
      message = 'Drugs found on a person, authorities have been notified, stay alert.'
      expect { subject.drugs_on_person }.to output(message).to_stdout
    end
  end

  describe '#drugs_in_package' do
    it { is_expected.to respond_to :drugs_in_package }
    it 'should give a warning about the threat' do
      message = 'Drugs found in a package, authorities have been notified, stay alert.'
      expect { subject.drugs_in_package }.to output(message).to_stdout
    end
  end

  describe '#weapon' do
    it { is_expected.to respond_to :weapon }
    it 'should give a warning about the threat' do
      message = 'weapons spotted, no planes will take off untill safety restored, authoroties have been notified, safety level dangerous.'
      expect { subject.weapon }.to output(message).to_stdout
    end
  end

  describe '#passenger_unwell' do
    it { is_expected.to respond_to :passenger_unwell }
    it 'should give a warning about the threat' do
      message = 'A passenger seems unwell, care personal have been notified, safety threat low.'
      expect { subject.passenger_unwell }.to output(message).to_stdout
    end
  end

  describe '#agressive_passenger' do
    it { is_expected.to respond_to :agressive_passenger }
    it 'should give a warning about the threat' do
      message = 'A passenger is acting agressive, authoroties have been notified, stay alert, safety level medium.'
      expect { subject.agressive_passenger }.to output(message).to_stdout
    end
  end

  describe '#terrorist' do
    it { is_expected.to respond_to :terrorist }
    it 'should give a warning about the threat' do
      message = 'A terrorist threat has been made at at this airport. Emediate close-down, nobody is to leave until the safety level is restored. Safety level extremely dangerous.'
      expect(subject.terrorist).to eq message
    end
  end

  describe '#safety_assesment' do
    it { is_expected.to respond_to :safety_assesment }
  end

end
