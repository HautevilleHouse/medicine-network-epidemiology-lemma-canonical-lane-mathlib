import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure ContactNetwork where
  population : Nat
  edgeSet : List (Nat × Nat)
  meanDegree : ℝ
  degreeDistribution : List ℝ
  percolationThreshold : ℝ

structure ContactNetworkEvidence (N : ContactNetwork) where
  meanDegreeCalculated : N.meanDegree = (List.sum (N.degreeDistribution)) / (N.population : ℝ)
  percolationThresholdDerived : N.percolationThreshold = 1 / N.meanDegree

def ContactNetworkClosed (N : ContactNetwork) : Prop :=
  N.meanDegree = (List.sum (N.degreeDistribution)) / (N.population : ℝ) ∧
  N.percolationThreshold = 1 / N.meanDegree

theorem contact_network_closed_from_evidence (N : ContactNetwork) (E : ContactNetworkEvidence N) :
    ContactNetworkClosed N := by
  exact And.intro E.meanDegreeCalculated E.percolationThresholdDerived

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean