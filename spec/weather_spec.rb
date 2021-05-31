require 'weather'

describe Weather do
  let(:weather) { double :weather}

  it 'can generate random weather' do
    allow(weather).to receive (:generate_random_number){subject.status}
  end
end