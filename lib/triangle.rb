class Triangle
  attr_reader :side1, :side2, :side3
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind 
    check_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else 
      :scalene
    end
  end

  def sides_zero?
    [side1, side2, side3].all?(&:positive?)
  end

  def triangle_inequality?
    side1 + side2 > side3 && side2 + side3 > side1 && side1 + side3 > side2
  end

  def check_triangle 
    raise TriangleError unless sides_zero? && triangle_inequality?
  end

  class TriangleError < StandardError
  end

end
