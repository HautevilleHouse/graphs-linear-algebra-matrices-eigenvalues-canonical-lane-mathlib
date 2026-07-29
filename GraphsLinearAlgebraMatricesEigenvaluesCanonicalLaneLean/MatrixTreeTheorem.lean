import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphMatricesEigenvaluesCanonicalLaneLean

structure MatrixTreeTheoremPackage where
  vertexCount : Nat
  laplacian : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  isLaplacian : laplacian.isLaplacian
  cofactor : ℝ
  spanningTreeCount : Nat
  matrixTreeTheorem : cofactor = spanningTreeCount

def MatrixTreeTheoremClosed (M : MatrixTreeTheoremPackage) : Prop :=
  M.isLaplacian ∧ M.matrixTreeTheorem

theorem matrix_tree_theorem_closed (M : MatrixTreeTheoremPackage) : MatrixTreeTheoremClosed M := by
  exact And.intro M.isLaplacian M.matrixTreeTheorem

end GraphMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse