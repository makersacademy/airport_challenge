class Aeroplane

  def initialize(plane_id, plane_name, passenger_capacity)
    @id = plane_id
    @name = plane_name
    @passenger_capacity = passenger_capacity
  end

  attr_reader :name, :id, :passenger_capacity

  def description
    "#{@name} with id:#{@id} has a passenger capacity of #{@passenger_capacity}"
  end

end
