defmodule RNATranscription do
  @nucleotides %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  def to_rna(dna) do
    Enum.map(dna, &convert_nucleotide/1)
  end

  defp convert_nucleotide(nucleotide) do
    case Map.get(@nucleotides, nucleotide) do
      found -> found
      _ -> nucleotide
    end
  end
end
