import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure Network where
  vertices : Type
  edges : vertices → vertices → Prop

structure EpidemicParameters where
  transmissionRate : ℝ
  recoveryRate : ℝ
  network : Network
  initialInfected : Set network.vertices

structure MedicineNetworkEpidemiologyAdmittedObject where
  parameters : EpidemicParameters
  reproductionNumber : ℝ
  thresholdCondition : ℝ ≤ 1
  conclusion : transmissionStops
  conclusionTerm : conclusion

def MedicineNetworkEpidemiologyWitnessClosed (O : MedicineNetworkEpidemiologyAdmittedObject) : Prop :=
  O.conclusion

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
