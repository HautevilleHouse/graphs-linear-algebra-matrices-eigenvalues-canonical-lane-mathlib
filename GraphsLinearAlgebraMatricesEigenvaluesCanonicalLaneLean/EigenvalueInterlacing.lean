import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure EigenvalueInterlacingPackage where
  originalGraph : GraphLaplacianPackage
  subgraph : GraphLaplacianPackage
  originalEigenvalues : List ℝ
  subgraphEigenvalues : List ℝ
  interlacingInequalities : ∀ i, subgraphEigenvalues[i] ≥ originalEigenvalues[i] ∧ subgraphEigenvalues[i] ≤ originalEigenvalues[i+1]

structure EigenvalueInterlacingEvidence (E : EigenvalueInterlacingPackage) where
  interlacingInequalitiesClosed : E.interlacingInequalities
  eigenvalueCountMatch : E.originalEigenvalues.length = E.subgraphEigenvalues.length + 1

def EigenvalueInterlacingClosed (E : EigenvalueInterlacingPackage) : Prop :=
  E.interlacingInequalities ∧ E.originalEigenvalues.length = E.subgraphEigenvalues.length + 1

theorem eigenvalue_interlacing_closed_from_evidence (E : EigenvalueInterlacingPackage)
    (Ev : EigenvalueInterlacingEvidence E) : EigenvalueInterlacingClosed E := by
  exact And.intro Ev.interlacingInequalitiesClosed Ev.eigenvalueCountMatch

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse