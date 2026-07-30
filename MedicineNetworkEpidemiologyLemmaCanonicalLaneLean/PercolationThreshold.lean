import MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.GraphSpectraPackage

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure PercolationPackage {G : GraphSpectraPackage} where
  bondPercolationThreshold : Prop
  sitePercolationThreshold : Prop
  infiniteClusterCondition : Prop
  criticalExponents : Prop

structure PercolationEvidence {G : GraphSpectraPackage} (P : PercolationPackage G) where
  bondPercolationThresholdClosed : P.bondPercolationThreshold
  sitePercolationThresholdClosed : P.sitePercolationThreshold
  infiniteClusterConditionClosed : P.infiniteClusterCondition
  criticalExponentsClosed : P.criticalExponents

def PercolationClosed {G : GraphSpectraPackage} (P : PercolationPackage G) : Prop :=
  P.bondPercolationThreshold ∧ P.sitePercolationThreshold ∧
  P.infiniteClusterCondition ∧ P.criticalExponents

theorem percolation_closed_from_evidence {G : GraphSpectraPackage}
    (P : PercolationPackage G) (E : PercolationEvidence P) :
    PercolationClosed P := by
  exact And.intro E.bondPercolationThresholdClosed
    (And.intro E.sitePercolationThresholdClosed
      (And.intro E.infiniteClusterConditionClosed E.criticalExponentsClosed))

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse