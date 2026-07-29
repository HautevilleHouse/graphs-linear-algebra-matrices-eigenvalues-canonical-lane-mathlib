import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure GraphPackage where
  vertexCount : ℕ
  edgeSet : Set (ℕ × ℕ)
  adjacencyMatrix : Matrix ℕ ℕ ℤ
  simpleGraph : Prop
  undirected : Prop
  noLoops : Prop
  adjacencySymmetric : adjacencyMatrixᵀ = adjacencyMatrix

def GraphPackage.adjacencyClosed (G : GraphPackage) : Prop :=
  G.simpleGraph ∧ G.undirected ∧ G.noLoops ∧ G.adjacencySymmetric

theorem adjacency_closed_from_props (G : GraphPackage) (h1 : G.simpleGraph) (h2 : G.undirected) (h3 : G.noLoops) (h4 : G.adjacencySymmetric) : graphClosed G := by
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse
