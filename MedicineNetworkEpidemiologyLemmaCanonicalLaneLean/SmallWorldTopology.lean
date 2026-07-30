import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure SmallWorldTopology (N : Type) where
  nodeSet : Set N
  localEdges : N → N → Prop
  randomEdges : N → N → Prop
  clusteringCoefficient : Real
  averagePathLength : Real
  closedTopology : Prop

structure SmallWorldTopologyEvidence (S : SmallWorldTopology N) where
  clusteringCoefficientNonnegative : S.clusteringCoefficient ≥ 0
  clusteringCoefficientLeOne : S.clusteringCoefficient ≤ 1
  averagePathLengthPositive : S.averagePathLength > 0
  closedTopologyTerm : S.closedTopology

def SmallWorldTopologyClosed (S : SmallWorldTopology N) : Prop :=
  S.closedTopology

theorem small_world_topology_closed_from_evidence
    (S : SmallWorldTopology N) (E : SmallWorldTopologyEvidence S) :
    SmallWorldTopologyClosed S :=
  E.closedTopologyTerm

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean