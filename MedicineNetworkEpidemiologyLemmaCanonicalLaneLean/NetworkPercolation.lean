import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure NetworkPercolation where
  network : ContactNetwork
  edgeOccupationProb : ℝ
  giantComponentExists : Prop
  percolationThresholdReached : Prop

structure PercolationEvidence (P : NetworkPercolation) where
  giantComponentExistsClosed : P.giantComponentExists
  percolationThresholdReachedClosed : P.percolationThresholdReached

def PercolationClosed (P : NetworkPercolation) : Prop :=
  P.giantComponentExists ∧ P.percolationThresholdReached

theorem percolation_closed_from_evidence (P : NetworkPercolation) (E : PercolationEvidence P) :
    PercolationClosed P := by
  exact And.intro E.giantComponentExistsClosed E.percolationThresholdReachedClosed

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean