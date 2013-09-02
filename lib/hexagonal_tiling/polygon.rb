module HexagonalTiling
  class Polygon

    attr_reader :poly_points

    # @param [Array<HexagonalTiling::Point>] poly_points the points that make up the polygon
    def initialize(poly_points)
      @poly_points = poly_points
    end

    # Crossing count algorithm for determining whether a point lies within a 
    # polygon or not. Source: http://www.visibone.com/inpoly/
    def contains?(point)
      raise "Not a valid polygon!" if @poly_points.size < 3
      is_inside = false
      old_p = @poly_points.last
      @poly_points.each do |new_p|
        if new_p.x > old_p.x
          first_p = old_p
          second_p = new_p
        else
          first_p = new_p
          second_p = old_p
        end
        if ((new_p.x < point.x) == (point.x <= old_p.x)) && ((point.y - first_p.y) * (second_p.x - first_p.x) < (second_p.y - first_p.y) * (point.x - first_p.x))
          is_inside = ! is_inside
        end
        old_p = new_p
      end

      is_inside
    end

  end
end