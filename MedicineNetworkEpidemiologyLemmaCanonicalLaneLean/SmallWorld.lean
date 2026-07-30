import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure SmallWorldPackage (N : NetworkModel) where
  averagePathLength : ℝ
  clusteringCoefficient : ℝ
  highClustering : Prop
  shortPaths : Prop

structure SmallWorldEvidence {N : NetworkModel} (S : SmallWorldPackage N) where
  highClusteringClosed : S.highClustering
  shortPathsClosed : S.shortPaths

def SmallWorldClosed {N : NetworkModel} (S : SmallWorldPackage N) : Prop :=
  S.highClustering ∧ S.shortPaths

theorem small_world_closed_from_evidence {N : NetworkModel} (S : SmallWorldPackage N) (E : SmallWorldEvidence S) : SmallWorldClosed S := by
  exact And.intro E.highClusteringClosed E.shortPathsClosed

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse