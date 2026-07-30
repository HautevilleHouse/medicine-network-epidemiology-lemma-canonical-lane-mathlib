import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure SmallWorldNetwork where
  latticeSize : Nat
  rewiringProb : ℝ
  clusteringCoefficient : ℝ
  averagePathLength : ℝ
  smallWorldProperty : Prop

structure SmallWorldEvidence (S : SmallWorldNetwork) where
  highClustering : S.clusteringCoefficient > 0.5
  shortPaths : S.averagePathLength < 2 * Real.log (S.latticeSize : ℝ)

def SmallWorldClosed (S : SmallWorldNetwork) : Prop :=
  S.clusteringCoefficient > 0.5 ∧ S.averagePathLength < 2 * Real.log (S.latticeSize : ℝ)

theorem small_world_closed_from_evidence (S : SmallWorldNetwork) (E : SmallWorldEvidence S) :
    SmallWorldClosed S := by
  exact And.intro E.highClustering E.shortPaths

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean