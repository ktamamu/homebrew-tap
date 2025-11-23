class Sglobal < Formula
  desc "AWS Security Group Global Access Scanner"
  homepage "https://github.com/ktamamu/sglobal"
  url "https://github.com/ktamamu/sglobal/archive/v0.1.1.tar.gz"
  sha256 "131947ae15ef41346955dea3dcd5fe18f2a401101a87574d9ae4b140a65f0500"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    # Test that the binary was installed correctly
    assert_match "AWS Security Group Global Access Scanner", shell_output("#{bin}/sglobal --help")
  end
end
