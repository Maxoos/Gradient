require "Gradient/version"
require "Gradient/rgb"
require "Gradient/convert"
require "Gradient/errors"



module Gradient
  def self.create *arg
    begin
      raise Error::ArgError if arg[0].nil? or arg[1].nil? or arg[2].nil?
      puts Convert.new(arg[0], arg[1], arg[2]).convert.join(", ")
    rescue Exception => e
        puts e.message
    end
  end
end