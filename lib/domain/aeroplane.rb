class Aeroplane

  FLYING = :flying
  TAKE_OFF = :take_off

  def initialize(plane_id, plane_name, status = FLYING)
    @id = plane_id
    @name = plane_name
    @status = status
  end

  attr_reader :name, :id, :status

  def description
    "#{@name} with id:#{@id} has a status: #{@status}"
  end

  def update_status(code)
    @status = code
  end

end
