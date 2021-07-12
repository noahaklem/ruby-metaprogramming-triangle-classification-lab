class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  
  def kind
    valid_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end

  def valid_triangle
    triangle = [(a + b > c), (a + c > b), (b + c > a)]
    triangle.each do |side|
      if side == false # || a + b < c || a + c <= b || b + c < a
        begin
          raise TriangleError
        end
      end
    end
  end

  class TriangleError < StandardError
  end

end
