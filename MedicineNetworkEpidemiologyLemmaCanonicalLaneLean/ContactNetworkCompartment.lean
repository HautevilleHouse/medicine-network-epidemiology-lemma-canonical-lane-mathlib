import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure ContactNetworkCompartment (N : Type) where
  population : N -> Nat
  susceptible : N -> Prop
  infectious : N -> Prop
  recovered : N -> Prop
  contactRate : (N -> N -> Real)
  transmissionRate : Real
  recoveryRate : Real
  closedBoundary : Prop

structure ContactNetworkCompartmentEvidence (C : ContactNetworkCompartment N) where
  susceptibleInfectiousDisjoint : ∀ n, C.susceptible n → ¬ C.infectious n
  infectiousRecoveredDisjoint : ∀ n, C.infectious n → ¬ C.recovered n
  recoveredSusceptibleDisjoint : ∀ n, C.recovered n → ¬ C.susceptible n
  contactRateNonnegative : ∀ n m, C.contactRate n m ≥ 0
  transmissionRatePositive : C.transmissionRate > 0
  recoveryRatePositive : C.recoveryRate > 0
  closedBoundaryTerm : C.closedBoundary

def ContactNetworkCompartmentClosed (C : ContactNetworkCompartment N) : Prop :=
  C.closedBoundary

theorem contact_network_compartment_closed_from_evidence
    (C : ContactNetworkCompartment N) (E : ContactNetworkCompartmentEvidence C) :
    ContactNetworkCompartmentClosed C :=
  E.closedBoundaryTerm

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean