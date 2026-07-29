import canonicalLaneMathlib.AdmissibleClass
import GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean.GraphAdjacency

namespace HautevilleHouse
namespace GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean

structure SpectralTheoremPackage (G : GraphPackage) where
  adjacencyMatrix : Matrix ℕ ℕ ℤ
  eigenvalueSet : List ℝ
  multiplicityData : List (ℝ × ℕ)
  orthonormalBasis : Prop
  spectralDecomposition : Prop
  adjacencyClosed : Prop

structure SpectralTheoremEvidence {G : GraphPackage} (S : SpectralTheoremPackage G) where
  eigenvalueSetClosed : S.eigenvalSet = sorted(eigenvalues)
  orthonormalBasisClosed : S.orthonormalBasis
  spectralDecompositionClosed : S.spectralDecomposition
  adjacencyClosed : S.adjacencyClosed

def SpectralTheoremClosed {G : GraphPackage} (S : SpectralTheoremPackage G) : Prop :=
  S.eigenvalSet.length = G.vertexCount ∧
  S.orthonormalBasis ∧
  S.spectralDecomposition

theorem spectral_theorem_closed_from_evidence
    {G : GraphPackage} (S : SpectralTheoremPackage G) (E : SpectralTheoremEvidence S) :
    SpectralTheoremClosed S := by
  exact And.intro E.eigenvalueSetClosed
    (And.intro E.orthonormalBasisClosed E.spectralDecompositionClosed)

end GraphsLinearAlgebraMatricesEigenvaluesCanonicalLaneLean
end HautevilleHouse
