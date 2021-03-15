require 'safety_breach'

describe SafetyBreach do
  describe '#unattended_item' do
    it { is_expected.to respond_to :unattended_item }
    it 'should give a warning about the threat' do
      expect(subject.unattended_item).to eq 'No safety breach.'
    end
  end

  describe '#drugs_on_person' do
    it { is_expected.to respond_to :drugs_on_person }
    it 'should give a warning about the threat' do
      expect(subject.drugs_on_person).to eq 'No safety breach.'
    end
  end

  describe '#drugs_in_package' do
    it { is_expected.to respond_to :drugs_in_package }
    it 'should give a warning about the threat' do
      expect(subject.drugs_in_package).to eq 'No safety breach.'
    end
  end

  describe '#weapon' do
    it { is_expected.to respond_to :weapon }
    it 'should give a warning about the threat' do
      expect(subject.weapon).to eq 'No safety breach.'
    end
  end

  describe '#passenger_unwell' do
    it { is_expected.to respond_to :passenger_unwell }
    it 'should give a warning about the threat' do
      expect(subject.passenger_unwell).to eq 'No safety breach.'
    end
  end

  describe '#agressive_passenger' do
    it { is_expected.to respond_to :agressive_passenger }
    it 'should give a warning about the threat' do
      expect(subject.agressive_passenger).to eq 'No safety breach.'
    end
  end

  describe '#terrorist' do
    it { is_expected.to respond_to :terrorist }
    it 'should give a warning about the threat' do
      expect { subject.terrorist }.to raise_error
    end
  end

  describe '#safety_assesment' do
    it { is_expected.to respond_to :safety_assesment }
    it 'should respond correctly to input' do
      safe_area = SafetyBreach.new([1])
      expect(safe_area.safety_assesment).to eq 'No safety breach.'
      terrorist_spotted = SafetyBreach.new([8])
      expect { terrorist_spotted.safety_assesment }.to raise_error
    end
  end

end
