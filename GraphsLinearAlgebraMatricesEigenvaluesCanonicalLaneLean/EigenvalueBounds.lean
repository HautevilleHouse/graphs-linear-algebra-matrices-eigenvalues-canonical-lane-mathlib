import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.SpectralDecomposition

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure EigenvalueBoundsPackage {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} (S : SpectralDecompositionPackage L) where
  largestEigenvalue : ℝ
  smallestEigenvalue : ℝ
  largestBound : largestEigenvalue ≤ 2 * (Fintype.card V) - 2
  smallestBound : smallestEigenvalue ≥ 0
  largestBoundClosed : largestBound
  smallestBoundClosed : smallestBound

def EigenvalueBoundsClosed {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} {S : SpectralDecompositionPackage L}
    (B : EigenvalueBoundsPackage S) : Prop :=
  B.largestBound ∧ B.smallestBound

theorem eigenvalue_bounds_closed_from_evidence
    {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} {S : SpectralDecompositionPackage L}
    (B : EigenvalueBoundsPackage S) (large : B.largestBound) (small : B.smallestBound) :
    EigenvalueBoundsClosed B := by
  exact And.intro large small

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse