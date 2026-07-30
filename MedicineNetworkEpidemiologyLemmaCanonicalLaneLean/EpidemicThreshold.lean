import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.NetworkContactModel

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure EpidemicThreshold where
  contactModel : NetworkContactModel
  basicReproductionNumber : Float
  herdImmunityThreshold : Float
  epidemicExistsAboveThreshold : Prop

structure EpidemicThresholdEvidence (T : EpidemicThreshold) where
  basicReproductionNumberClosed : T.basicReproductionNumber > 1.0
  herdImmunityThresholdClosed : T.herdImmunityThreshold > 0.0
  epidemicExistsAboveThresholdClosed : T.epidemicExistsAboveThreshold

def EpidemicThresholdClosed (T : EpidemicThreshold) : Prop :=
  T.basicReproductionNumber > 1.0 ∧ T.herdImmunityThreshold > 0.0 ∧
  T.epidemicExistsAboveThreshold

theorem epidemic_threshold_closed_from_evidence (T : EpidemicThreshold)
    (E : EpidemicThresholdEvidence T) : EpidemicThresholdClosed T := by
  exact And.intro E.basicReproductionNumberClosed
    (And.intro E.herdImmunityThresholdClosed
      E.epidemicExistsAboveThresholdClosed)

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse