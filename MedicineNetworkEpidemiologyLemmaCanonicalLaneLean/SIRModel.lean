import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure SIRModel (N : NetworkModel) where
  susceptible : Set N.Node
  infected : Set N.Node
  recovered : Set N.Node
  transmissionRate : ℝ
  recoveryRate : ℝ
  dynamics : Prop

structure SIREvidence {N : NetworkModel} (S : SIRModel N) where
  transmissionRatePositive : 0 ≤ S.transmissionRate
  recoveryRatePositive : 0 ≤ S.recoveryRate
  dynamicsClosed : S.dynamics

def SIRModelClosed {N : NetworkModel} (S : SIRModel N) : Prop :=
  (0 ≤ S.transmissionRate) ∧ (0 ≤ S.recoveryRate) ∧ S.dynamics

theorem sir_model_closed_from_evidence {N : NetworkModel} (S : SIRModel N) (E : SIREvidence S) : SIRModelClosed S := by
  exact And.intro E.transmissionRatePositive (And.intro E.recoveryRatePositive E.dynamicsClosed)

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse