import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphMatricesEigenvaluesCanonicalLaneLean

structure AdjacencyEigenvaluePackage where
  vertexCount : Nat
  adjacencyMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  isAdjacency : adjacencyMatrix.isAdjacency
  spectrum : List ℝ
  spectralRadius : ℝ
  spectralRadiusClosed : spectralRadius = maxAbs eigenvalue
  regularGraphCondition : spectralRadius = degree ↔ graphIsRegular

def AdjacencyEigenvalueClosed (A : AdjacencyEigenvaluePackage) : Prop :=
  A.isAdjacency ∧ A.spectralRadiusClosed ∧ A.regularGraphCondition

theorem adjacency_eigenvalue_closed (A : AdjacencyEigenvaluePackage) : AdjacencyEigenvalueClosed A := by
  refine And.intro A.isAdjacency (And.intro A.spectralRadiusClosed A.regularGraphCondition)

end GraphMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse