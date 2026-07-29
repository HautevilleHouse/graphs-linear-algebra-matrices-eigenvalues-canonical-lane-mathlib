import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure GraphEigenvalueBoundsPackage where
  graph : GraphLaplacianPackage
  maxEigenvalue : ℝ
  minEigenvalue : ℝ
  degreeBounds : maxEigenvalue ≤ 2 * (max degree in graph) ∧ minEigenvalue ≥ 0
  eigenvalueBounds : minEigenvalue ≤ maxEigenvalue

structure GraphEigenvalueBoundsEvidence (G : GraphEigenvalueBoundsPackage) where
  degreeBoundsClosed : G.degreeBounds
  eigenvalueBoundsClosed : G.eigenvalueBounds

def GraphEigenvalueBoundsClosed (G : GraphEigenvalueBoundsPackage) : Prop :=
  G.degreeBounds ∧ G.eigenvalueBounds

theorem graph_eigenvalue_bounds_closed_from_evidence (G : GraphEigenvalueBoundsPackage)
    (Ev : GraphEigenvalueBoundsEvidence G) : GraphEigenvalueBoundsClosed G := by
  exact And.intro Ev.degreeBoundsClosed Ev.eigenvalueBoundsClosed

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse