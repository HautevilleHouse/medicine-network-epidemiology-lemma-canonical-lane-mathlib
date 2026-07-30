import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure SIRCompartmentModel where
  susceptible : ℝ
  infected : ℝ
  recovered : ℝ
  transmissionRate : ℝ
  recoveryRate : ℝ
  basicReproNumber : ℝ

structure SIRModelEvidence (M : SIRCompartmentModel) where
  populationConserved : M.susceptible + M.infected + M.recovered = 1
  basicReproNumberDerived : M.basicReproNumber = M.transmissionRate / M.recoveryRate

def SIRModelClosed (M : SIRCompartmentModel) : Prop :=
  M.susceptible + M.infected + M.recovered = 1 ∧
  M.basicReproNumber = M.transmissionRate / M.recoveryRate

theorem sir_model_closed_from_evidence (M : SIRCompartmentModel) (E : SIRModelEvidence M) :
    SIRModelClosed M := by
  exact And.intro E.populationConserved E.basicReproNumberDerived

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean