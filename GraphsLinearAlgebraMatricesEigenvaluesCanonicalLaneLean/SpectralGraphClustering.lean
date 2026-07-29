import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphMatricesEigenvaluesCanonicalLaneLean

structure SpectralClusteringPackage where
  similarityGraph : GraphLaplacianPackage
  k : Nat
  eigenvectorSubset : Matrix (Fin similarityGraph.vertexCount) (Fin k) ℝ
  kMeansResult : Prop
  clusterAssignment : Fin similarityGraph.vertexCount → Fin k
  clusteringQuality : ℝ
  qualityCondition : clusteringQuality ≥ 0.5 → clusterStructureDetected

def SpectralClusteringClosed (S : SpectralClusteringPackage) : Prop :=
  GraphLaplacianClosed S.similarityGraph ∧ S.kMeansResult ∧
  (S.clusteringQuality ≥ 0.5 → S.clusterStructureDetected)

theorem spectral_clustering_closed (S : SpectralClusteringPackage) : SpectralClusteringClosed S := by
  refine And.intro (graph_laplacian_closed_iff S.similarityGraph) (And.intro S.kMeansResult ?_)
  exact S.clusteringQuality → S.clusterStructureDetected

end GraphMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse