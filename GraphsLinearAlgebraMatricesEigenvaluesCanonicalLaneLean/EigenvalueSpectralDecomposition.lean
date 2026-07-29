import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure EigenvaluePackage (V : Type u) (A : AdjacencyMatrixPackage V) where
  eigenvalues : Vector ℝ A.n
  eigenvectors : Matrix (Fin A.n) (Fin A.n) ℝ
  spectralTheorem : Prop
  eigenvaluesReal : Prop
  eigenvectorsOrthonormal : Prop

structure EigenvalueEvidence (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) where
  spectralTheoremClosed : E.spectralTheorem
  eigenvaluesRealClosed : E.eigenvaluesReal
  eigenvectorsOrthonormalClosed : E.eigenvectorsOrthonormal

def EigenvalueClosed (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) : Prop :=
  E.spectralTheorem ∧ E.eigenvaluesReal ∧ E.eigenvectorsOrthonormal

theorem eigenvalue_closed_from_evidence (V : Type u) (A : AdjacencyMatrixPackage V)
    (E : EigenvaluePackage V A) (Ev : EigenvalueEvidence V A E) : EigenvalueClosed V A E :=
  And.intro Ev.spectralTheoremClosed (And.intro Ev.eigenvaluesRealClosed Ev.eigenvectorsOrthonormalClosed)

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse