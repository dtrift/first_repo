# frozen_string_literal: true

class TrainCargo < Train
  include Validation

  def type
    :cargo
  end
end
