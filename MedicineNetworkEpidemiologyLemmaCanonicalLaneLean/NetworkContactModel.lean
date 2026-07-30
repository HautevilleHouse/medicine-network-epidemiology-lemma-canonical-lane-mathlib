import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure NetworkContactModel where
  populationSize : Nat
  infectionRate : Float
  recoveryRate : Float
  contactMatrix : List (List Float)
  adjacencySpectralRadius : Float
  scaleFreeProperty : Prop

structure NetworkContactModelEvidence (M : NetworkContactModel) where
  populationSizeClosed : M.populationSize > 0
  infectionRateClosed : M.infectionRate > 0.0
  recoveryRateClosed : M.recoveryRate > 0.0
  contactMatrixClosed : M.contactMatrix.length = M.populationSize
  adjacencySpectralRadiusClosed : M.adjacencySpectralRadius > 0.0
  scaleFreePropertyClosed : M.scaleFreeProperty

def NetworkContactModelClosed (M : NetworkContactModel) : Prop :=
  M.populationSize > 0 ∧ M.infectionRate > 0.0 ∧ M.recoveryRate > 0.0 ∧
  M.contactMatrix.length = M.populationSize ∧ M.adjacencySpectralRadius > 0.0 ∧
  M.scaleFreeProperty

theorem network_contact_model_closed_from_evidence (M : NetworkContactModel)
    (E : NetworkContactModelEvidence M) : NetworkContactModelClosed M := by
  exact And.intro E.populationSizeClosed
    (And.intro E.infectionRateClosed
      (And.intro E.recoveryRateClosed
        (And.intro E.contactMatrixClosed
          (And.intro E.adjacencySpectralRadiusClosed
            E.scaleFreePropertyClosed))))

end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse