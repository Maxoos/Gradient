module Gradient
  class Rgb

    attr_reader :r,:g,:b,:hex

    def initialize *input
      # NOTE: Add more cases to support future color inputs. i.e. Array for 0.1,0.4,0.5
      case
        # hex
        when (input[0].kind_of?(String) and input[0][0] == "#")
          hex_input input[0]
        # 8 bit RGB
        when (input.kind_of?(Array) and input.map { |_input| _input.is_a? Integer}.all?)
          rgb_integer_input input
        else
          raise Error::RGBKindError
      end
    end

    def hex_input input
      @hex = input.upcase
      # hex to r,g,b
      @r,@g,@b = hex.scan(/[0-9A-Fa-f]{2}/).map {|color| color.hex}
    end

    def rgb_integer_input input
      # clip and map to r,g,b
      @r,@g,@b = input.map { |n| [0, [255, n].min].max}
      # convert to hex and pad
      _hex = [@r,@g,@b].map { |component| component.to_s(16).rjust(2, '0') }
      # add #
      @hex = _hex.join.insert(0, "#").upcase
    end

    # utility method to help with comparison between colors
    def sum
      [@r,@g,@b].inject(:+)
    end

  end
end