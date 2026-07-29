import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphMatricesEigenvaluesCanonicalLaneLean

structure GraphSpectralFormalizationPackage where
  graphLaplacian : GraphLaplacianPackage
  adjacency : AdjacencyEigenvaluePackage
  clustering : SpectralClusteringPackage
  cheeger : CheegerInequalityPackage
  matrixTree : MatrixTreeTheoremPackage
  centrality : EigenvectorCentralityPackage
  consistency : graphLaplacian.vertexCount = adjacency.vertexCount ∧
               graphLaplacian.vertexCount = clustering.similarityGraph.vertexCount ∧
               graphLaplacian.vertexCount = cheeger.graph.vertexCount ∧
               graphLaplacian.vertexCount = matrixTree.vertexCount ∧
               graphLaplacian.vertexCount = centrality.adjacency.vertexCount

def GraphSpectralFormalizationClosed (G : GraphSpectralFormalizationPackage) : Prop :=
  GraphLaplacianClosed G.graphLaplacian ∧ AdjacencyEigenvalueClosed G.adjacency ∧
  SpectralClusteringClosed G.clustering ∧ CheegerInequalityClosed G.cheeger ∧
  MatrixTreeTheoremClosed G.matrixTree ∧ EigenvectorCentralityClosed G.centrality ∧
  G.consistency

theorem graph_spectral_formalization_closed (G : GraphSpectralFormalizationPackage) : GraphSpectralFormalizationClosed G := by
  refine And.intro (graph_laplacian_closed_iff G.graphLaplacian) (And.intro (adjacency_eigenvalue_closed G.adjacency) (And.intro (spectral_clustering_closed G.clustering) (And.intro (cheeger_inequality_closed G.cheeger) (And.intro (matrix_tree_theorem_closed G.matrixTree) (And.intro (eigenvector_centrality_closed G.centrality) G.consistency)))))

end GraphMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse