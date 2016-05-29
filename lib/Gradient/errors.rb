module Error
  class RGBKindError < ArgumentError
    def message
      "This color input class is not yet supported"
    end
  end
  class ArgError < ArgumentError
    def message
      "Please use Gradient.create(#000000,#FFFFFF,16) to create a gradient"
    end
  end
end
