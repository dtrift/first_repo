class TrainPassenger < Train
  attr_reader :type

  def initialize(type = :type)
    @type = type
  end

  def type
    :pasenger
  end

end
