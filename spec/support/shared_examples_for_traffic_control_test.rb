shared_examples_for TrafficControl do
  describe 'take off during a storm' do
    it 'tells planes they can not land during a storm' do
      expect { subject.take_off_during_storm }.to raise_error 'Plane can not take off during a storm.'
    end
  end

  describe 'landing during a storm' do
    it 'tells planes they can not take off during a storm' do
      expect { subject.landing_during_storm }.to raise_error 'Plane can not land during a storm.'
    end
  end

  describe 'landing when the airport is full' do
    it 'tells planes they can not land if the airport is full' do
      expect { subject.landing_when_airport_is_full }.to raise_error 'Plane can not land, the airport is full.'
    end
  end
end