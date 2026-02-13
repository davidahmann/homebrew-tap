class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.9/gait_1.0.9_darwin_arm64.tar.gz"
      sha256 "ec0dc64d5c6e16a159241182c3cc04907772cdd4b3f81e786cb95ead308d70f0"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.9/gait_1.0.9_darwin_amd64.tar.gz"
      sha256 "14695b72b90a89c3b5533d7df24547ecec02127460459fab4bac5b8f91b534a0"
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
