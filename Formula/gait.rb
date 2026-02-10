class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.1/gait_1.0.1_darwin_arm64.tar.gz"
      sha256 "82123c532d4e5659b61bbeb27cf6ea7bc5ea2aa57de4cf5c4a2d2c2abf0b9bff"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.1/gait_1.0.1_darwin_amd64.tar.gz"
      sha256 "0f6085496402d4729600e263fc2afd53dda48c03a6e4facba424f52f335e162a"
    end
  end

  def install
    bin.install "gait"
  end

  test do
    output = shell_output("#{bin}/gait demo --json")
    assert_match "\"run_id\"", output
  end
end
