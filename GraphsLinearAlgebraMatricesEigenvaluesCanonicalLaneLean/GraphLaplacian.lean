import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.AdjacencyMatrix

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure LaplacianPackage {V : Type u} [Fintype V] (A : AdjacencyMatrixPackage V) where
  degreeMatrix : Matrix (Fin A.n) (Fin A.n) ℤ
  laplacian : Matrix (Fin A.n) (Fin A.n) ℤ
  laplacianDefined : laplacian = degreeMatrix - A.matrix
  positivity : Prop
  positivityClosed : positivity

def LaplacianClosed {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V} (L : LaplacianPackage A) : Prop :=
  L.laplacianDefined ∧ L.positivity

theorem laplacian_closed_from_evidence
    {V : Type u} [Fintype V] {A : AdjacencyMatrixPackage V} (L : LaplacianPackage A)
    (defn : L.laplacianDefined) (pos : L.positivity) : LaplacianClosed L := by
  exact And.intro defn pos

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse