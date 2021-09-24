require 'domain/aeroplane'

describe Aeroplane do
  $plane_id = 123
  $plane_name = "plane_name"
  $passenger_capacity = 100
  $status = :JFK
  subject = described_class.new($plane_id, $plane_name, $passenger_capacity, $status)
  describe '#plane_description' do
    it 'returns a description of the plane' do
      expect(subject.description).to eq "#{$plane_name} with id:#{$plane_id} has a passenger capacity of #{$passenger_capacity}"
    end
  end
  describe '#name' do
    it 'returns the name of the plane' do
      expect(subject.name).to eq $plane_name
    end
  end

  describe '#id' do
    it 'returns the id of the plane' do
      expect(subject.id).to eq $plane_id
    end
  end

  describe '#capacity' do
    it 'returns the capacity of the plane' do
      expect(subject.passenger_capacity).to eq $passenger_capacity
    end
  end

  describe '#status' do
    it 'returns the status of the current plane' do
      expect(subject.status).to eq :JFK
    end
  end

  describe '#update_status' do
    it 'updates the status of the current plane' do
      subject.update_status(:LHR)
      expect(subject.status).to eq :LHR
    end
  end

end
