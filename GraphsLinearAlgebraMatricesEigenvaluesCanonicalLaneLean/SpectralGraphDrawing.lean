import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure SpectralDrawingPackage (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) where
  fiedlerVector : Vector ℝ A.n
  partition : V → Fin 2
  fiedlerDefined : fiedlerVector = E.eigenvectors 1
  partitionFromSign : partition v = if fiedlerVector (indexOf v) ≥ 0 then 0 else 1

structure SpectralDrawingEvidence (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) (S : SpectralDrawingPackage V A E) where
  fiedlerDefinedClosed : S.fiedlerDefined
  partitionFromSignClosed : S.partitionFromSign

def SpectralDrawingClosed (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) (S : SpectralDrawingPackage V A E) : Prop :=
  S.fiedlerDefined ∧ S.partitionFromSign

theorem spectral_drawing_closed_from_evidence (V : Type u) (A : AdjacencyMatrixPackage V)
    (E : EigenvaluePackage V A) (S : SpectralDrawingPackage V A E) (Ev : SpectralDrawingEvidence V A E S) : SpectralDrawingClosed V A E S :=
  And.intro Ev.fiedlerDefinedClosed Ev.partitionFromSignClosed

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse