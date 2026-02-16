class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  version "1.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.2.3/gait_1.2.3_darwin_arm64.tar.gz"
      sha256 "bbe4d5c7c7c98b245707fc2ba1e99c5107e9bae794b0f210a4c750e92272fbc3"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.2.3/gait_1.2.3_darwin_amd64.tar.gz"
      sha256 "48afd64993e7aeef2136097b32afe4236ee09189318614b6659f4f8f7b0a2111"
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
