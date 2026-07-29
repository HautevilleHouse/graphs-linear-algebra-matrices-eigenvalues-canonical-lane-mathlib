import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure LaplacianMatrixPackage (V : Type u) (A : AdjacencyMatrixPackage V) where
  degreeMatrix : Matrix (Fin A.n) (Fin A.n) ℕ
  laplacian : Matrix (Fin A.n) (Fin A.n) ℤ
  degreeDiagonal : Prop
  laplacianDefined : laplacian = degreeMatrix.map (fun x : ℕ => (x : ℤ)) - A.adjacencyMatrix.map (fun x : ℕ => (x : ℤ))

structure LaplacianEvidence (V : Type u) (A : AdjacencyMatrixPackage V) (L : LaplacianMatrixPackage V A) where
  degreeDiagonalClosed : L.degreeDiagonal
  laplacianDefinedClosed : L.laplacianDefined

def LaplacianClosed (V : Type u) (A : AdjacencyMatrixPackage V) (L : LaplacianMatrixPackage V A) : Prop :=
  L.degreeDiagonal ∧ L.laplacianDefined

theorem laplacian_closed_from_evidence (V : Type u) (A : AdjacencyMatrixPackage V)
    (L : LaplacianMatrixPackage V A) (E : LaplacianEvidence V A L) : LaplacianClosed V A L :=
  And.intro E.degreeDiagonalClosed E.laplacianDefinedClosed

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse