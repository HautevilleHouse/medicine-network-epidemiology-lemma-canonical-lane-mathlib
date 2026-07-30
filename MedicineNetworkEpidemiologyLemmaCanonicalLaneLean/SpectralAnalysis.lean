import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure SpectralAnalysis (G : Type) where
  adjacencyMatrix : Matrix G G Real
  eigenvalues : List Real
  spectralRadius : Real
  closedSpectral : Prop

structure SpectralAnalysisEvidence (S : SpectralAnalysis G) where
  eigenvaluesCorrect : S.eigenvalues = eigenvalues (S.adjacencyMatrix)
  spectralRadiusNonnegative : S.spectralRadius ≥ 0
  closedSpectralTerm : S.closedSpectral

def SpectralAnalysisClosed (S : SpectralAnalysis G) : Prop :=
  S.closedSpectral

theorem spectral_analysis_closed_from_evidence
    (S : SpectralAnalysis G) (E : SpectralAnalysisEvidence S) :
    SpectralAnalysisClosed S :=
  E.closedSpectralTerm

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean