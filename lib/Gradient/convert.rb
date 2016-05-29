module Gradient
  class Convert

    attr_reader :output_array

    def initialize start_hex, end_hex, steps
      @start_hex = Rgb.new(start_hex)
      @end_hex = Rgb.new(end_hex)
      @steps = steps-1
    end

    def convert
      @output_array = [@start_hex.hex]
      r_diff = calc_diff @start_hex.r, @end_hex.r
      g_diff = calc_diff @start_hex.g, @end_hex.g
      b_diff = calc_diff @start_hex.b, @end_hex.b
      for i in 1..@steps
        @output_array << Rgb.new((@start_hex.r + r_diff * i ).to_i,
                                 (@start_hex.g + g_diff * i ).to_i,
                                 (@start_hex.b + b_diff * i ).to_i).hex
      end
      @output_array
    end

    private

    def calc_diff one, two
      diff = (one - two).abs / @steps.to_f
      diff *= -1 if one > two
      diff
    end

  end
end