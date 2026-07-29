import GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure GraphLaplacianSpectrumPackage where
  vertexCount : ℕ
  adjacencyMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  degreeMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  laplacianMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  eigenvalues : List ℝ
  eigenvectorBasis : List (Fin vertexCount → ℝ)
  laplacianIsSymmetric : laplacianMatrix = laplacianMatrixᵀ
  eigenvaluesAreReal : ∀ λ ∈ eigenvalues, λ ∈ ℝ
  laplacianPosSemidefinite : ∀ v, DotProduct v (laplacianMatrix · v) ≥ 0
  zeroEigenvalueMultiplicity : ℕ
  algebraicConnectivity : ℝ
deriving Repr

structure GraphLaplacianSpectrumEvidence (G : GraphLaplacianSpectrumPackage) where
  laplacianIsSymmetricClosed : G.laplacianIsSymmetric
  eigenvaluesAreRealClosed : G.eigenvaluesAreReal
  laplacianPosSemidefiniteClosed : G.laplacianPosSemidefinite

def GraphLaplacianSpectrumClosed (G : GraphLaplacianSpectrumPackage) : Prop :=
  G.laplacianIsSymmetric ∧ G.eigenvaluesAreReal ∧ G.laplacianPosSemidefinite

theorem graphLaplacianSpectrumClosed_from_evidence
    (G : GraphLaplacianSpectrumPackage) (E : GraphLaplacianSpectrumEvidence G) :
    GraphLaplacianSpectrumClosed G := by
  exact And.intro E.laplacianIsSymmetricClosed
    (And.intro E.eigenvaluesAreRealClosed E.laplacianPosSemidefiniteClosed)

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse
