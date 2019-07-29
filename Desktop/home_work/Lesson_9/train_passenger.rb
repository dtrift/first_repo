# frozen_string_literal: true

class TrainPassenger < Train
  include Validation

  def type
    :passenger
  end
end
