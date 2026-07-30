import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure NetworkModel where
  Node : Type u
  Edge : Type v
  adjacency : Node → Node → Prop
  edgeWeight : Edge → ℝ
  finiteGraph : Fintype Node
  undirected : Symmetric adjacency

structure NetworkModelEvidence (N : NetworkModel) where
  finiteGraphClosed : N.finiteGraph
  undirectedClosed : N.undirected

def NetworkModelClosed (N : NetworkModel) : Prop :=
  N.finiteGraph ∧ N.undirected

theorem network_model_closed_from_evidence (N : NetworkModel) (E : NetworkModelEvidence N) : NetworkModelClosed N := by
  exact And.intro E.finiteGraphClosed E.undirectedClosed

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse