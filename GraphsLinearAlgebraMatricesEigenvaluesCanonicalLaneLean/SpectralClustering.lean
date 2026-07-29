import GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.PerronFrobeniusTheorem

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure SpectralClusteringPackage where
  dataPoints : ℕ
  similarityGraph : GraphLaplacianSpectrumPackage
  smallestEigenvalues : List ℝ
  eigenvectorSubspace : List (Fin dataPoints → ℝ)
  clusteringAssignment : Fin dataPoints → ℕ
  numberOfClusters : ℕ
  clusteringQuality : Prop
deriving Repr

structure SpectralClusteringEvidence (S : SpectralClusteringPackage) where
  clusteringQualityClosed : S.clusteringQuality

def SpectralClusteringClosed (S : SpectralClusteringPackage) : Prop :=
  S.clusteringQuality

theorem spectralClustering_closed_from_evidence
    (S : SpectralClusteringPackage) (E : SpectralClusteringEvidence S) :
    SpectralClusteringClosed S := by
  exact E.clusteringQualityClosed

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse
