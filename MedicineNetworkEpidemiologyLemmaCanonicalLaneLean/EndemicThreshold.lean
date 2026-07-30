import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure EndemicThreshold where
  sirModel : SIRCompartmentModel
  contactNetwork : ContactNetwork
  thresholdValue : ℝ
  epidemicPossible : Prop
  epidemicImpossible : Prop

structure EndemicThresholdEvidence (E : EndemicThreshold) where
  thresholdDerived : E.thresholdValue = 1 / (E.contactNetwork.meanDegree * E.sirModel.basicReproNumber)
  epidemicPossibleIfAbove : E.epidemicPossible → E.sirModel.basicReproNumber * E.contactNetwork.meanDegree > 1
  epidemicImpossibleIfBelow : E.epidemicImpossible → E.sirModel.basicReproNumber * E.contactNetwork.meanDegree ≤ 1

def EndemicThresholdClosed (E : EndemicThreshold) : Prop :=
  E.thresholdValue = 1 / (E.contactNetwork.meanDegree * E.sirModel.basicReproNumber) ∧
  (E.epidemicPossible → E.sirModel.basicReproNumber * E.contactNetwork.meanDegree > 1) ∧
  (E.epidemicImpossible → E.sirModel.basicReproNumber * E.contactNetwork.meanDegree ≤ 1)

theorem endemic_threshold_closed_from_evidence (E : EndemicThreshold) (Ev : EndemicThresholdEvidence E) :
    EndemicThresholdClosed E := by
  exact And.intro Ev.thresholdDerived (And.intro Ev.epidemicPossibleIfAbove Ev.epidemicImpossibleIfBelow)

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean