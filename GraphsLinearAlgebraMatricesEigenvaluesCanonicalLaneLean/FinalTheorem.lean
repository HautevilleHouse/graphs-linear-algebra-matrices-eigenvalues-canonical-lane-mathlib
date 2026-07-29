import canonicalLaneMathlib.AdmissibleClass
import GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.BridgeLemmas
import GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

def ConstrainedSpectralClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_spectral_endgame (A : AdmissibleClass) :
    ConstrainedSpectralClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse
