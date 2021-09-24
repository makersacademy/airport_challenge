class Aeroplane

  FLYING = :flying

  def initialize(plane_id, plane_name, passenger_capacity, status = FLYING)
    @id = plane_id
    @name = plane_name
    @passenger_capacity = passenger_capacity
    @status = status
  end

  attr_reader :name, :id, :passenger_capacity, :status

  def description
    "#{@name} with id:#{@id} has a passenger capacity of #{@passenger_capacity}"
  end

  def update_status(code)
    @status = code
  end

end
