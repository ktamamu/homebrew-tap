class Sglobal < Formula
  desc "AWS Security Group Global Access Scanner"
  homepage "https://github.com/ktamamu/sglobal"
  url "https://github.com/ktamamu/sglobal/archive/v1.0.0.tar.gz"
  sha256 "YOUR_SHA256_HERE"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  on_macos do
    if Hardware::CPU.intel?
      # Intel Mac support
    end
    if Hardware::CPU.arm?
      # Apple Silicon Mac support
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Linux x86_64 support
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Linux ARM64 support
      end
    end
  end

  test do
    # Test that the binary was installed correctly
    assert_match "AWS Security Group Global Access Scanner", shell_output("#{bin}/sglobal --help")
  end
end