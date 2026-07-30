import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyLemmaCanonicalLaneLean

structure EpidemicSpreadModel (N : Type) where
  compartments : ContactNetworkCompartment N
  spectralData : SpectralAnalysis N
  percolation : PercolationThreshold N
  topology : SmallWorldTopology N
  basicReproductionNumber : Real
  diseaseFreeEquilibrium : Prop
  endemicEquilibrium : Prop
  closedModel : Prop

structure EpidemicSpreadModelEvidence (E : EpidemicSpreadModel N) where
  reproductionNumberComputed : E.basicReproductionNumber = 
    (E.compartments.transmissionRate) / (E.compartments.recoveryRate)
  diseaseFreeStable : E.diseaseFreeEquilibrium
  endemicStable : E.endemicEquilibrium
  closedModelTerm : E.closedModel

def EpidemicSpreadModelClosed (E : EpidemicSpreadModel N) : Prop :=
  E.closedModel

theorem epidemic_spread_model_closed_from_evidence
    (E : EpidemicSpreadModel N) (Ev : EpidemicSpreadModelEvidence E) :
    EpidemicSpreadModelClosed E :=
  Ev.closedModelTerm

end HautevilleHouse
end MedicineNetworkEpidemiologyLemmaCanonicalLaneLean