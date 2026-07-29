import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure AdjacencyMatrixData (V : Type u) where
  vertices : Finset V
  edges : V → V → Prop
  symmetric : edges a b ↔ edges b a
  noLoops : ¬ edges a a

structure AdjacencyMatrixPackage (V : Type u) where
  n : Nat
  matrixData : AdjacencyMatrixData V
  adjacencyMatrix : Matrix (Fin n) (Fin n) ℕ
  zeroOneEntries : Prop
  symmetricMatrix : Prop
  traceZero : Prop

structure AdjacencyMatrixEvidence (V : Type u) (A : AdjacencyMatrixPackage V) where
  zeroOneEntriesClosed : A.zeroOneEntries
  symmetricMatrixClosed : A.symmetricMatrix
  traceZeroClosed : A.traceZero

def AdjacencyMatrixClosed (V : Type u) (A : AdjacencyMatrixPackage V) : Prop :=
  A.zeroOneEntries ∧ A.symmetricMatrix ∧ A.traceZero

theorem adjacency_matrix_closed_from_evidence (V : Type u) (A : AdjacencyMatrixPackage V)
    (E : AdjacencyMatrixEvidence V A) : AdjacencyMatrixClosed V A :=
  And.intro E.zeroOneEntriesClosed (And.intro E.symmetricMatrixClosed E.traceZeroClosed)

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse