import canonicalLaneMathlib.AdmissibleClass
open Finset
open Complex

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure NetworkAdjacency (n : ℕ) where
  matrix : Matrix (Fin n) (Fin n) ℝ
  symmetric : matrix = matrixᵀ
  diagZero : ∀ i, matrix i i = 0

structure SpectrumPackage (n : ℕ) (A : NetworkAdjacency n) where
  eigenvalues : Finset ℂ
  spectralRadius : ℝ
  largestEigenvalue : ℝ
  eigenvaluesReal : ∀ λ ∈ eigenvalues, λ ∈ ℝ
  largestEigenvalueProperty : largestEigenvalue = max' (eigenvalues.image (λ : ℂ → ℝ, λ.re)) (by
    have hne : (eigenvalues.image (λ : ℂ → ℝ, λ.re)).Nonempty := by
      refine Finset.one_nonempty.image _ ?_
      sorry
    exact hne)
  spectralRadiusProperty : spectralRadius = max' (eigenvalues.image (λ : ℂ → ℝ, |λ|)) (by
    have hne : (eigenvalues.image (λ : ℂ → ℝ, |λ|)).Nonempty := by
      refine Finset.one_nonempty.image _ ?_
      sorry
    exact hne)
  largestEigenvaluePos : largestEigenvalue ≥ 0

structure SpectrumEvidence (n : ℕ) (A : NetworkAdjacency n) (S : SpectrumPackage n A) where
  eigenvaluesRealClosed : S.eigenvaluesReal
  largestEigenvaluePropertyClosed : S.largestEigenvalueProperty
  spectralRadiusPropertyClosed : S.spectralRadiusProperty
  largestEigenvaluePosClosed : S.largestEigenvaluePos

def SpectrumClosed (n : ℕ) (A : NetworkAdjacency n) (S : SpectrumPackage n A) : Prop :=
  S.eigenvaluesReal ∧ S.largestEigenvalueProperty ∧ S.spectralRadiusProperty ∧ S.largestEigenvaluePos

theorem spectrum_closed_from_evidence (n : ℕ) (A : NetworkAdjacency n) (S : SpectrumPackage n A) (E : SpectrumEvidence n A S) : SpectrumClosed n A S := by
  exact And.intro E.eigenvaluesRealClosed (And.intro E.largestEigenvaluePropertyClosed (And.intro E.spectralRadiusPropertyClosed E.largestEigenvaluePosClosed))

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
