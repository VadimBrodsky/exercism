class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers = [*2..@limit]

    numbers.each_with_index do |number, index|
      next if number.zero?
      (index...(numbers.length)).step(number) do |m|
        numbers[m] = 0 unless number == numbers[m]
      end
    end.reject(&:zero?)
  end
end
