class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.0/gait_1.0.0_darwin_arm64.tar.gz"
      sha256 "4e1d06f9dc1d1305c2e3bf1e10ee71551716264bd807895b06f992917d8de22b"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.0/gait_1.0.0_darwin_amd64.tar.gz"
      sha256 "78ad27b162b5033eaf02232c06b1440e0925b2bfd47297b1d94c1319383ab8ab"
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
