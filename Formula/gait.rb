class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.6/gait_1.0.6_darwin_arm64.tar.gz"
      sha256 "5dc0a96a8035482f3b5149bba4a2ce7f6fc9497fbf6603edffb81515e975922f"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.6/gait_1.0.6_darwin_amd64.tar.gz"
      sha256 "58beb715a6d51e330a0c94dbcd8399ea6a9f0d9feb4b210aba2e8d8b7e9356b0"
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
