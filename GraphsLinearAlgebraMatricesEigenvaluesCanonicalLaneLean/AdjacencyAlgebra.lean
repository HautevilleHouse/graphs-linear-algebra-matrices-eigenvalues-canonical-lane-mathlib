import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure AdjacencyAlgebraPackage (V : Type u) (A : AdjacencyMatrixPackage V) where
  polynomialMatrix : Polynomial ℝ → Matrix (Fin A.n) (Fin A.n) ℝ
  evaluation : ℝ → Matrix (Fin A.n) (Fin A.n) ℝ
  algebraClosed : ∀ p q, polynomialMatrix (p * q) = polynomialMatrix p * polynomialMatrix q

structure AdjacencyAlgebraEvidence (V : Type u) (A : AdjacencyMatrixPackage V) (Alg : AdjacencyAlgebraPackage V A) where
  algebraClosedClosed : Alg.algebraClosed

def AdjacencyAlgebraClosed (V : Type u) (A : AdjacencyMatrixPackage V) (Alg : AdjacencyAlgebraPackage V A) : Prop :=
  Alg.algebraClosed

theorem adjacency_algebra_closed_from_evidence (V : Type u) (A : AdjacencyMatrixPackage V)
    (Alg : AdjacencyAlgebraPackage V A) (Ev : AdjacencyAlgebraEvidence V A Alg) : AdjacencyAlgebraClosed V A Alg :=
  Ev.algebraClosedClosed

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse