class Complement
  DNA_TO_RNA_KEY = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(rna = '')
    return '' unless valid_dna?(rna)
    rna.chars.map { |nuc| DNA_TO_RNA_KEY[nuc] }.join
  end

  def self.valid_dna?(strand)
    strand.chars.uniq.all? { |nuc| DNA_TO_RNA_KEY.key? nuc }
  end

  private_class_method :valid_dna?
end

module BookKeeping
  VERSION = 4
end
