import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure EpidemicSpreadPackage (N : NetworkModel) (S : SIRModel N) where
  finalSize : ℝ
  peakInfected : ℝ
  timeToPeak : ℝ
  basicReproNumber : ℝ
  spreadCondition : Prop

structure EpidemicSpreadEvidence {N : NetworkModel} {S : SIRModel N} (E : EpidemicSpreadPackage N S) where
  basicReproNumberPositive : 0 ≤ E.basicReproNumber
  spreadConditionClosed : E.spreadCondition

def EpidemicSpreadClosed {N : NetworkModel} {S : SIRModel N} (E : EpidemicSpreadPackage N S) : Prop :=
  (0 ≤ E.basicReproNumber) ∧ E.spreadCondition

theorem epidemic_spread_closed_from_evidence {N : NetworkModel} {S : SIRModel N} (E : EpidemicSpreadPackage N S) (Ev : EpidemicSpreadEvidence E) : EpidemicSpreadClosed E := by
  exact And.intro Ev.basicReproNumberPositive Ev.spreadConditionClosed

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse