class Ytclip < Formula
  include Language::Python::Virtualenv

  desc "Self-hosted YouTube clip creator"
  homepage "https://ytclip.xyz"
  url "https://files.pythonhosted.org/packages/86/3d/de4f2eb88763edaafae4ef67bfc2b7b08eac84c3e4629704fa9b078476d9/ytclip_app-1.0.3.tar.gz"
  sha256 "c18f663528a7596eb65176a410abd732bcc303f0d9611c5be467066d99b2a457"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "ytclip-app==#{version}"
    bin.install_symlink libexec/"bin/ytclip"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ytclip version")
  end
end