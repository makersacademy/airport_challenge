require 'weather'
require 'airport'

RSpec.describe Weather do
	 describe '#stormy' do
			it 'will return true if weather conditon matches stormy' do
				allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
				expect(subject.stormy?).to eq true
			end

			it 'returns false if random weather condition is not eq to stormy' do
				expect(subject.stormy?).to eq false unless subject.stormy?
			end
	 end

	 describe '#random_conditon' do
		 it 'chooses random from the weather conditions array' do
			 expect(subject.random_condition).to include("")
		 end
	 end
end
