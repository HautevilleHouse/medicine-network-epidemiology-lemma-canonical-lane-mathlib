import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure GraphSpectraPackage (N : NetworkModel) where
  adjacencyMatrix : Matrix N.Node N.Node ℝ
  eigenvalues : List ℝ
  spectralRadius : ℝ
  eigenvalueGap : ℝ

def GraphSpectraClosed {N : NetworkModel} (G : GraphSpectraPackage N) : Prop :=
  G.eigenvalueGap > 0

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse