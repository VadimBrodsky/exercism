class Raindrops
  def self.convert(number)
    to_drops(number) || number.to_s
  end

  class << self
    private

    DROPS = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }.freeze

    def to_drops(number)
      return nil unless factors?(number, DROPS.keys)
      DROPS.keys.inject('') { |a, e| a + factor_string(number, e) }
    end

    def factor?(number, f)
      (number % f).zero?
    end

    def factor_string(number, f)
      factor?(number, f) ? DROPS[f] : ''
    end

    def factors?(number, factors)
      factors.any? { |f| factor?(number, f) }
    end
  end
end

module BookKeeping
  VERSION = 2
end


class Test
  CAN_SEE = 'me'

  class << self
    private

    CANT = 'who?'
  end
end

require 'pry'; binding.pry

