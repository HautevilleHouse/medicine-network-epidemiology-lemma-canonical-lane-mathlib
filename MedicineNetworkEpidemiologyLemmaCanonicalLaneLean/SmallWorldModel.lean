import MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.PercolationThreshold

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure SmallWorldPackage {G : GraphSpectraPackage} where
  clusteringCoefficient : Prop
  averagePathLength : Prop
  rewiringProbability : Prop
  emergenceCondition : Prop

structure SmallWorldEvidence {G : GraphSpectraPackage} (S : SmallWorldPackage G) where
  clusteringCoefficientClosed : S.clusteringCoefficient
  averagePathLengthClosed : S.averagePathLength
  rewiringProbabilityClosed : S.rewiringProbability
  emergenceConditionClosed : S.emergenceCondition

def SmallWorldClosed {G : GraphSpectraPackage} (S : SmallWorldPackage G) : Prop :=
  S.clusteringCoefficient ∧ S.averagePathLength ∧
  S.rewiringProbability ∧ S.emergenceCondition

theorem small_world_closed_from_evidence {G : GraphSpectraPackage}
    (S : SmallWorldPackage G) (E : SmallWorldEvidence S) :
    SmallWorldClosed S := by
  exact And.intro E.clusteringCoefficientClosed
    (And.intro E.averagePathLengthClosed
      (And.intro E.rewiringProbabilityClosed E.emergenceConditionClosed))

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse