import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.NetworkContactModel

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure PercolationSpread where
  contactModel : NetworkContactModel
  infectionProbability : Float
  giantComponentThreshold : Float
  epidemicSize : Nat
  outbreakProbability : Float

structure PercolationSpreadEvidence (P : PercolationSpread) where
  infectionProbabilityClosed : P.infectionProbability > 0.0
  giantComponentThresholdClosed : P.giantComponentThreshold > 0.0
  epidemicSizeClosed : P.epidemicSize > 0
  outbreakProbabilityClosed : P.outbreakProbability > 0.0

def PercolationSpreadClosed (P : PercolationSpread) : Prop :=
  P.infectionProbability > 0.0 ∧ P.giantComponentThreshold > 0.0 ∧
  P.epidemicSize > 0 ∧ P.outbreakProbability > 0.0

theorem percolation_spread_closed_from_evidence (P : PercolationSpread)
    (E : PercolationSpreadEvidence P) : PercolationSpreadClosed P := by
  exact And.intro E.infectionProbabilityClosed
    (And.intro E.giantComponentThresholdClosed
      (And.intro E.epidemicSizeClosed
        E.outbreakProbabilityClosed))

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse