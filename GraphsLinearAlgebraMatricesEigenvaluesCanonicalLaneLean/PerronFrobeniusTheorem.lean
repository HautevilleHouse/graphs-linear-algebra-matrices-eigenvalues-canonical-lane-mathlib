import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure PerronFrobeniusData (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) where
  spectralRadius : ℝ
  perronRoot : ℝ
  perronVector : Vector ℝ A.n
  spectralRadiusDominates : spectralRadius = max' (Finset.image (fun λ : ℝ => |λ|) (Finset.range A.n)) (by
    apply Finset.max'_mem; exact Finset.image_nonempty.mpr ?_)
  perronRootPositive : perronRoot > 0
  perronVectorPositive : ∀ i, perronVector i > 0
  perronEigenvalue : E.eigenvalues = Vector.map (fun λ : ℝ => λ) (Vector.ofList [perronRoot])

structure PerronFrobeniusEvidence (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) (P : PerronFrobeniusData V A E) where
  spectralRadiusDominatesClosed : P.spectralRadiusDominates
  perronRootPositiveClosed : P.perronRootPositive
  perronVectorPositiveClosed : P.perronVectorPositive
  perronEigenvalueClosed : P.perronEigenvalue

def PerronFrobeniusClosed (V : Type u) (A : AdjacencyMatrixPackage V) (E : EigenvaluePackage V A) (P : PerronFrobeniusData V A E) : Prop :=
  P.spectralRadiusDominates ∧ P.perronRootPositive ∧ P.perronVectorPositive ∧ P.perronEigenvalue

theorem perron_frobenius_closed_from_evidence (V : Type u) (A : AdjacencyMatrixPackage V)
    (E : EigenvaluePackage V A) (P : PerronFrobeniusData V A E) (Ev : PerronFrobeniusEvidence V A E P) : PerronFrobeniusClosed V A E P :=
  And.intro Ev.spectralRadiusDominatesClosed (And.intro Ev.perronRootPositiveClosed (And.intro Ev.perronVectorPositiveClosed Ev.perronEigenvalueClosed))

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse