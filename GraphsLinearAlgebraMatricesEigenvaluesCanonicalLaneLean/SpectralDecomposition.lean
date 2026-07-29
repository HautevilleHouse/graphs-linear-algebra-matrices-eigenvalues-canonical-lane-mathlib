import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.GraphLaplacian

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure SpectralDecompositionPackage {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    (L : LaplacianPackage A) where
  eigenValues : List ℝ
  eigenVectors : List (Fin L.degreeMatrix.rows.succ → ℝ)
  orthonormalBasis : Prop
  orthonormalBasisClosed : orthonormalBasis
  spectralTheorem : Prop
  spectralTheoremClosed : spectralTheorem

def SpectralDecompositionClosed {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} (S : SpectralDecompositionPackage L) : Prop :=
  S.orthonormalBasis ∧ S.spectralTheorem

theorem spectral_decomposition_closed_from_evidence
    {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} (S : SpectralDecompositionPackage L)
    (orth : S.orthonormalBasis) (spec : S.spectralTheorem) : SpectralDecompositionClosed S := by
  exact And.intro orth spec

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse