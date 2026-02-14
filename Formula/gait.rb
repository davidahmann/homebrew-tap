class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.2.0/gait_1.2.0_darwin_arm64.tar.gz"
      sha256 "f431af2a7d3ac35415d71fec7c6eca2639c6f2cf2fbfbbba35e04ea5c1b0b2d5"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.2.0/gait_1.2.0_darwin_amd64.tar.gz"
      sha256 "998967d99a112620aae08ddfbd095dd6cb936e566fb23f19a6a3335fc892c6bd"
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
