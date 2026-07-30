import MedicineNetworkEpidemiologyLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure GraphSpectraPackage where
  adjacencyMatrix : Type
  laplacianMatrix : Type
  spectralRadius : Prop
  spectralGap : Prop
  algebraicConnectivity : Prop
  eigenvalueDistribution : Prop

structure GraphSpectraEvidence (G : GraphSpectraPackage) where
  spectralRadiusClosed : G.spectralRadius
  spectralGapClosed : G.spectralGap
  algebraicConnectivityClosed : G.algebraicConnectivity
  eigenvalueDistributionClosed : G.eigenvalueDistribution

def GraphSpectraClosed (G : GraphSpectraPackage) : Prop :=
  G.spectralRadius ∧ G.spectralGap ∧ G.algebraicConnectivity ∧ G.eigenvalueDistribution

theorem graph_spectra_closed_from_evidence (G : GraphSpectraPackage) (E : GraphSpectraEvidence G) :
    GraphSpectraClosed G := by
  exact And.intro E.spectralRadiusClosed
    (And.intro E.spectralGapClosed
      (And.intro E.algebraicConnectivityClosed E.eigenvalueDistributionClosed))

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse