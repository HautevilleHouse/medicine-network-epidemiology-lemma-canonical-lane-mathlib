import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.NetworkContactModel
import HautevilleHouse.MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.EpidemicThreshold
import HautevilleHouse.MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.PercolationSpread

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

def MedicineNetworkEpidemiologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem medicine_network_epidemiology_endgame (A : AdmissibleClass) :
    MedicineNetworkEpidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse