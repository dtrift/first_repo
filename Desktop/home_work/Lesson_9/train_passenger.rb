# frozen_string_literal: true
include Validation

class TrainPassenger < Train
  def type
    :passenger
  end
end
