require 'formula'
require 'caveats'

module Homebrew extend self
  def caveats
    raise FormulaUnspecifiedError if ARGV.named.empty?
    
    ARGV.formulae.each do |f|
      puts_caveats f
    end
  end

  def puts_caveats f
    c = Caveats.new(f)
    unless c.empty?
      ohai "#{f.name}: Caveats", c.caveats
      puts
    end
  end
end

Homebrew.caveats