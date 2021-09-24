module PlaneIdGenerator
  def generate_id(id_length = 4)
    id = (0...id_length).map { rand(65..90).chr }.join
  end
end
