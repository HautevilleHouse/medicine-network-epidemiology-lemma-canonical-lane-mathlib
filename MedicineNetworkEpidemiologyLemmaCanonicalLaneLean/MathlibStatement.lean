import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation := {
  sourceKey := "MedicineNetworkEpidemiologyLemma",
  theoremObject := "ReproductionNumber < 1 => epidemic stops",
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific Mathlib endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

theorem mathlib_common_core_imported_checked :
    mathlibProofObligation.commonCoreImported = true := by
  rfl

theorem mathlib_theorem_specific_definitions_native_checked :
    mathlibProofObligation.theoremSpecificDefinitionsNative = true := by
  rfl

theorem mathlib_theorem_specific_bridge_native_checked :
    mathlibProofObligation.theoremSpecificBridgeNative = true := by
  rfl

theorem mathlib_theorem_specific_admitted_closure_native_checked :
    mathlibProofObligation.theoremSpecificAdmittedClosureNative = true := by
  rfl

def theoremSpecificEndgamePilotClosed : Prop :=
  forall A : AdmissibleClass, ConstrainedMedicineNetworkEpidemiologyClosure A

theorem theorem_specific_endgame_pilot_checked :
    theoremSpecificEndgamePilotClosed := by
  intro A
  exact constrained_medicine_network_epidemiology_endgame A

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
