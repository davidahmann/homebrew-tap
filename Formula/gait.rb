class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.6/gait_1.0.6_darwin_arm64.tar.gz"
      sha256 "b8c5828094beeff176f232987b2e2463eaa70845a131f3fdde974517c986f443"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.6/gait_1.0.6_darwin_amd64.tar.gz"
      sha256 "ddbfeddba89b3883b9aa2bc3aff9912ce7719624e069d91931fac0f6d8908868"
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
