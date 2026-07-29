import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphMatricesEigenvaluesCanonicalLaneLean

structure EigenvectorCentralityPackage where
  adjacency : AdjacencyEigenvaluePackage
  principalEigenvector : Vector ℝ (Fin adjacency.vertexCount)
  centralityScores : Vector ℝ (Fin adjacency.vertexCount)
  centralityDefined : adjacency.adjacencyMatrix * principalEigenvector = adjacency.spectralRadius * principalEigenvector
  scoresFromEigenvector : centralityScores = principalEigenvector.normalize

def EigenvectorCentralityClosed (E : EigenvectorCentralityPackage) : Prop :=
  AdjacencyEigenvalueClosed E.adjacency ∧ E.centralityDefined ∧ E.scoresFromEigenvector

theorem eigenvector_centrality_closed (E : EigenvectorCentralityPackage) : EigenvectorCentralityClosed E := by
  refine And.intro (adjacency_eigenvalue_closed E.adjacency) (And.intro E.centralityDefined E.scoresFromEigenvector)

end GraphMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse