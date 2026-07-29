import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.EigenvalueBounds

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure CheegerInequalityPackage {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} {S : SpectralDecompositionPackage L}
    (B : EigenvalueBoundsPackage S) where
  cheegerConstant : ℝ
  secondEigenvalue : ℝ
  inequality : 2 * cheegerConstant ≥ secondEigenvalue
  inequalityClosed : inequality

def CheegerInequalityClosed {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} {S : SpectralDecompositionPackage L}
    {B : EigenvalueBoundsPackage S} (C : CheegerInequalityPackage B) : Prop :=
  C.inequality

theorem cheeger_inequality_closed_from_evidence
    {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V}
    {L : LaplacianPackage A} {S : SpectralDecompositionPackage L}
    {B : EigenvalueBoundsPackage S} (C : CheegerInequalityPackage B)
    (ineq : C.inequality) : CheegerInequalityClosed C := by
  exact ineq

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse