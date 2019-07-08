class WagonPassenger < Wagon
  attr_reader :busy_seats

  def initialize(seats = 25) # 25 - значение по умолчанию
    @seats = seats.to_i
    @busy_seats = 0
  end

  def type
    :passenger
  end

  def counter_busy_seats
    # при вызове метода прибавить единицу к переменной метода
    @busy_seats += 1 if @busy_seats < @seats
  end

  def seats
    # начальное количество мест минус количество занятых мест
    @seats - @busy_seats
  end

end
