import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure PercolationPackage (N : NetworkModel) where
  threshold : ℝ
  infectedSet : Set N.Node
  infectionProbability : ℝ
  epidemicCondition : Prop

structure PercolationEvidence {N : NetworkModel} (P : PercolationPackage N) where
  thresholdClosed : 0 ≤ P.threshold ∧ P.threshold ≤ 1
  infectedSetClosed : Set.Nonempty P.infectedSet
  epidemicConditionClosed : P.epidemicCondition

def PercolationClosed {N : NetworkModel} (P : PercolationPackage N) : Prop :=
  (0 ≤ P.threshold ∧ P.threshold ≤ 1) ∧ Set.Nonempty P.infectedSet ∧ P.epidemicCondition

theorem percolation_closed_from_evidence {N : NetworkModel} (P : PercolationPackage N) (E : PercolationEvidence P) : PercolationClosed P := by
  exact And.intro E.thresholdClosed (And.intro E.infectedSetClosed E.epidemicConditionClosed)

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse