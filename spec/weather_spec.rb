require 'weather'

describe Weather do

  describe '#generate_weather' do
    it 'is a method that generates random weather' do
      expect(subject).to respond_to(:generate_weather)
    end

    it 'Randomly generates stormy weather' do
      allow_any_instance_of(Random).to receive(:rand).and_return(1)
      expect(subject.generate_weather).to eq "Stormy"
    end
  end

end
